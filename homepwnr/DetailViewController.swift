//
//  DetailViewController.swift
//  homepwnr
//
//  Created by methos on 22.02.17.
//  Copyright © 2017 methos. All rights reserved.
//

import UIKit


//  Зачем UINavigationControllerDelegate ? 
//  он необходим для PickerDelegate

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //  Забираем нужную картинку
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        //  Записываем картинку в кэш
        
        imageStore.setImage(image, forKey: item.itemKey)
        
        //  Передаем и кладем на экран
        
        imageView.image = image
        
        //  убиваем окно
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func takePicture(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        
        //  if the device has a camera, take a picture; otherwise
        
        //  just pick from photo library
        
        //  если есть камера
        //  то источник камера - по кнопке
        //  если нет, то источник фотолаборатория
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        }
        else {
            imagePicker.sourceType = .photoLibrary
        }
        
        //  делегируем по полной :) - программно
        
        imagePicker.delegate = self
        
        
        //  теперь выводим все это дело на экран
        //  как и в случае с переходами между фрэймами
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    var item: Item! {
        
        didSet {
        
        navigationItem.title = item.name
        }
        
    }
    
    var imageStore: ImageStore! //  заводим переменную типа ImageStore - class
    
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
        
        //  Получаем ключ ячейки
        let key = item.itemKey
        
        //  Если такой ключ есть, то отображаем его
        let imageToDisplay = imageStore.image(forKey: key)
        
        imageView.image = imageToDisplay
        
        
    }
    
    
}
