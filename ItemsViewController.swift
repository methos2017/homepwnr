//
//  ItemsViewController.swift
//  homepwnr
//
//  Created by methos on 08.02.17.
//  Copyright © 2017 methos. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    
    var itemStore: ItemStore!
    var imageStore: ImageStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        
        //  Make a new index path for 0th section, last row
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
        
        //  Insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        
        //  Create a new item and add it to the store in massive
        let newItem = itemStore.createItem()
        
        //  Figure out where that item in in the array
        if let index = itemStore.allItems.index(of: newItem) {
            
                let indexPath = IndexPath(row: index, section: 0)
            
                //  Insert this new row into the table
                tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        
        // If you are currently in editing mode...
        if isEditing {
            
            //  Change text of button to iform user of state
            sender.setTitle("Edit", for:. normal)
            
            //  Turn off editing mode
            setEditing(false, animated: true)
        } else {
            //  Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            //  Enter editing mode
            setEditing(true, animated: true)
        }
        
    }
 
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //  Update the model
        
            itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //  If the table view as asking to commit a delete command..
        
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: . cancel, handler: nil)
            
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            
                //  Remove the item from the store
                self.itemStore.removeItem(item)
                
                //  Удаляем также картинку и из кэша
                self.imageStore.deleteImage(forKey: item.itemKey)
                
                //  Also remove that row from the table view with an animation
                
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            })
            
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil) // present it modally
            //  Remove the item from the store
            itemStore.removeItem(item)
            
            
            //  Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
        
        //  section
        //  by default only 1
        //  but example address book with multiply sections
    }
    
    override func   tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  default identify - UITableViewCell
        //  create an instance of UITableViewCell, with default appearance
        
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        //  Set the text on the cell with the desctiption of the item
        //  that is at the nth index of items, where n = row this cell
        //  will appear in on the tableview
        
        let item = itemStore.allItems[indexPath.row]
        
       /* cell.textLabel?.text = item.name // 1.name  n.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"  //  1.valueInDollars n.valueInDollars */
        
        //  Configure the cell with the Item
        
        cell.nameLabel.text = item.name
        cell.serialNumbersLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        

        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //  Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
 //       tableView.rowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension //  default
        tableView.estimatedRowHeight = 65
        
    }
    
    //  переключатель перехода для меню
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  If the triggered segue is the "showItem" segue
        
        switch segue.identifier {
            
            
        case "showItem"?: // optional String
            //  Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                //  Get the item associated with this row and pass it along
                
                //  Все данные подгрузили из Seague
                
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
                detailViewController.imageStore = imageStore
                
            }
            
        default:
            
            preconditionFailure("Unexpected segue idetifier.") // crash the application
            
        }
    }
    
    
    
}
