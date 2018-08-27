//
//  ViewController.swift
//  Todoey
//
//  Created by Sabri Gurbuz on 8/22/18.
//  Copyright © 2018 Sabri Gurbuz. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    
//    var defaults = UserDefaults.standard
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
        print(dataFilePath)
        
//        let newItem1 = Item()
//        newItem1.title = "Buy milk"
//        itemArray.append(newItem1)
//
//        let newItem2 = Item()
//        newItem2.title = "Study IOS programming"
//        itemArray.append(newItem2)

        loadItems()
//
//        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
//            print(items)
//            itemArray = items
//        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoList", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
    
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    //MARK - tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // things will happen when te user clicks the add item
            if let text = textField.text {
                let newItem = Item()
                newItem.title = text
                self.itemArray.append(newItem)
            }
            
//            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.saveItems()
        }
        
        let cancell = UIAlertAction(title: "Cancell", style: .default) { (cancellAction) in
            print("Cancell")
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        alert.addAction(cancell)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }
        catch {
            print("Error with encoding: \(error)")
        }
        
         tableView.reloadData()
    }
    
    func loadItems() {

        if let data = try? Data(contentsOf: dataFilePath!) {
            
            do {
                itemArray = try PropertyListDecoder().decode([Item].self, from: data)
            }
            catch {
                print(" Error loading data : \(error)")
            }
        }
   
    }
    
}

