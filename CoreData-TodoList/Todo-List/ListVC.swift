//
//  TodoList.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/19.
//

import UIKit
import CoreData

//UITableViewController
final class ListVC: UIViewController {
    
    //데이터 소스 역할을 할 배열 변수
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()

    //데이터를 읽어올 메소드 - fetch(코어 데이터에서 레코드를 읽어ㄴ오는 과정)
    func fetch() -> [NSManagedObject] {
        // 1.앱 델리게이트 객체 참조
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2. 관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        
        // 3. 요청 객체 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        
        // 4. 데이터 가져오기
        let result = try! context.fetch(fetchRequest)
        
        return result
    }
    
    //데이터 저장 메소드
    func save(title: String) -> Bool {
        let date = Date()
        
        // 1. 앱 델리게이트 객체 참조
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2. 관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        
        // 3. 관리 객체 생성 & 값을 설정
        let object = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context)
        object.setValue(title, forKey: "title")
        object.setValue(date, forKey: "createDate")
//        object.setValue(modifyDate(), forKey: "modifyDate")
        
        // 4. 영구 저장소에 커밋되고 나면 list 프로퍼티에 추가한다.
        do {
            try context.save()
            self.list.append(object)
            return true
        } catch {
            context.rollback()
            return false
        }
        
    }
    
    //데이터 삭제
    func delete(object: NSManagedObject) -> Bool {
        // 1. 앱 델리게이트 객체 참조
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2. 관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        
        // 3. 컨텍스트로부터 해당 객체 삭제
        context.delete(object)
        
        // 4. 영구 저장소에 커밋한다.
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
    //데이터 수정
    func edit(object: NSManagedObject, title: String, contents: String) -> Bool {
        let date = Date()
        
        // 1. 앱 델리게이트 객체 참조
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2. 관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        
        // 3. 관리 객체의 값 수정
        object.setValue(title, forKey: "title")
        object.setValue(date, forKey: "modifyDate")
//        object.setValue(isCompleted, forKey: "isCompleted")
        
        // 영구 저장소에 반영
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
    
    //데이터 저장 버튼에 대한 액션 메소드
    @objc func add(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 추가", message: nil, preferredStyle: .alert)
        
        //입력 필드 추가
        alert.addTextField() { $0.placeholder = "할 일을 입력해주세요."}
        
        //버튼 추가
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text, let contents = alert.textFields?.last?.text else {
                return
            }
            
            if self.save(title: title) == true {
               self.tableView.reloadData()
                
            }
        })
        self.present(alert, animated: false)
    }
    
    //화면 및 로직 초기화 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        tableViewLayout()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .yellow
        self.view.backgroundColor = .red
        
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(_:)))
        
        self.navigationItem.rightBarButtonItem = addBtn
    }
    
}

extension ListVC {
    private func addSubView() {
        view.addSubview(tableView)
       
    }
    
    func tableViewLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
}


extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        //해당 데이터 가져오기
         let record = self.list[indexPath.row]
        //let id = record.value(forKey: "id") as? String
        let title = record.value(forKey: "title") as? String
        let createDate = record.value(forKey: "createDate") as? Date
        let modifyDate = record.value(forKey: "modifyDate") as? Date
        let isCompleted = record.value(forKey: "isCompleted") as? Bool
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as! ListCell
        cell.title.text = title
        
        if let createDate {
            cell.createDateLabel.text = "생성날짜: " + dateFormatter.string(from: createDate)
        }
        
        if let modifyDate {
            cell.modifyDateLabel.text = "수정날짜: " + dateFormatter.string(from: modifyDate)
        }
        
        return cell
    }
}

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1.선택된 행에 해당하는 데이터 가져오기
        let object = self.list[indexPath.row]
        let title = object.value(forKey: "title") as? String
        //여기 더 추가하기 !!!!!! Date
        
        let alert = UIAlertController(title: "게시글 수정", message: nil, preferredStyle: .alert)
        
        // 2.입력 필드 추가(기존 값 입력)
        alert.addTextField() { $0.text = title }
        
        // 3. 버튼 추가(Cancel & Save)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alert.addAction(UIAlertAction(title: "Save", style: .default) {(_) in
            guard let title = alert.textFields?.first?.text else {
                return
            }
            
            // 4. 값 수정 메소드 호출, 그 결과가 성공이면 테이블 뷰 리로드
            if self.edit(object: object, title: title, contents: "" ) == true {
                self.tableView.reloadData()
            }
        })
        self.present(alert, animated: false)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //삭제할 대상 객체
        let object = self.list[indexPath.row]
        
        if self.delete(object: object) {
            //코어 데이터에서 삭제되고 나면 배열 목록과 테이블 뷰의 행도 삭제
            self.list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
}
