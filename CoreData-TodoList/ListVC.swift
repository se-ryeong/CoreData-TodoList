//
//  TodoList.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/19.
//

import UIKit
import CoreData

final class ListVC: UITableViewController {
    
    //데이터 소스 역할을 할 배열 변수
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()

//    var tableView: UITableView = {
//        var view = UITableView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//
//    }()
//
    
    
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

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tv: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //해당 데이터 가져오기
        let record = self.list[indexPath.row]
        let id = record.value(forKey: "id") as? String
        let title = record.value(forKey: "title") as? String
        let createDate = record.value(forKey: "createDate") as? String
        let modifyDate = record.value(forKey: "modifyDate") as? String
        let isCompleted = record.value(forKey: "isCompleted") as? String
        
        //셀 생성, 값 대입
        let cell = tv.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = title
        
        return cell
    }
}
