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
        // 1. 앱 델리게이트 객체 참조
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2. 관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        
        // 3. 관리 객체 생성 & 값을 설정
        let object = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context)
        object.setValue(title, forKey: "title")
//        object.setValue(createDate(), forKey: "createDate")
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
               // self.tableView.reloadData() ???????
                
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
        //해당 데이터 가져오기
         let record = self.list[indexPath.row]
        //let id = record.value(forKey: "id") as? String
        let title = record.value(forKey: "title") as? String
        //let createDate = record.value(forKey: "createDate") as? String
        //let modifyDate = record.value(forKey: "modifyDate") as? String
        //let isCompleted = record.value(forKey: "isCompleted") as? String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as! ListCell
        cell.title.text = title
        
        return cell
    }
}

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
