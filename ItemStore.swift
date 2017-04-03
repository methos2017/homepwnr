//
//  ItemStore.swift
//  homepwnr
//
//  Created by methos on 12.02.17.
//  Copyright © 2017 methos. All rights reserved.
//

import UIKit


//  Swift base class

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
    /*    for _ in 0..<5 {
            createItem()
            
            // otherwise let _ = createItem()
        }*/
    }
    
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
        
        
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        
        if fromIndex == toIndex {
            
            return
            
        }
        
        // Get refernce to object being moved so you can reinsert it
        
        let movedItem = allItems[fromIndex]
        
        //  Remove item from array
        
        allItems.remove(at: fromIndex)
        
        //  Insert item in array at new location
        
        allItems.insert(movedItem, at: toIndex)
        
        
    }

    
}

//let newItem = ItemStore.createItem()






