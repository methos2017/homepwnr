//
//  DetailViewController.swift
//  homepwnr
//
//  Created by methos on 22.02.17.
//  Copyright © 2017 methos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBAction func takePicture(_ sender: Any) {
    }
    
    
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    var item: Item!
    
    let numberFormatter: NumberFormatter = {
        
        // преобразуем в номерной формат, два числа после запятой
        //  min и max
        //  все на стандартных свойствах
    
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
        
    }()
    
    let dateFormatter: DateFormatter = {
        
        
        //  заряжаем функцию
        //  преобразуем в формат даты
        //  свойство стиль - medium
        //  свойство временный стиль - нет такого
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        return formatter
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        
  //      valueField.text = "\(item.valueInDollars)"
  //      dateLabel.text = "\(item.dateCreated)"
        
        
        //  перегоняем данные в String
        
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
        
    }
    
    
}
