//
//  ViewController.swift
//  BundleExample
//
//  Created by Bhavin Kansagara on 02/08/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

struct Person {
    var name: String
    var age: Int
}
class PersonInfoCell: UITableViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblAge: UILabel!
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var arrayData: [Person] = []
    var arrayNameCollection = ["Amit", "Paresh", "Magnesh", "Bharat", "Ramnesh", "Alpesh", "Rohit", "Minkesh", "Ravi", "Nilesh", "Rushi", "Darshan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDataSource()
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.reloadData()
    }
    
    func createDataSource() {
        let p1 = Person(name: "Bhavin", age: 28)
        let p2 = Person(name: "Mukesh", age: 27)
        let p3 = Person(name: "Rajesh", age: 24)
        let p4 = Person(name: "Niraj", age: 29)
        let p5 = Person(name: "Ajay", age: 28)
        
        arrayData.append(p1)
        arrayData.append(p2)
        arrayData.append(p3)
        arrayData.append(p4)
        arrayData.append(p5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController {
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
       print("add pressed")
        
        let randomAge = getRandomAge()
        let randomName = getRandomName()
        let p = Person(name: randomName, age: randomAge)
        arrayData.append(p)
        
        self.tableView.reloadData()
    }
    
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
        print("edit pressed")
        tableView.isEditing = !tableView.isEditing
    }
    
    //MARK: - To get the random name
    func getRandomAge() -> Int {
        let age = Int(Date.timeIntervalSinceReferenceDate) % 100
        return age
    }
    
    func getRandomName() -> String {
        let randomIndex = Int(Date.timeIntervalSinceReferenceDate) % arrayNameCollection.count
        let name = arrayNameCollection[randomIndex]
        return name
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PersonInfoCell
        
        let person = arrayData[indexPath.row]
        cell.lblName.text = person.name
        cell.lblAge.text = String(person.age)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayData.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
