//
//  ImageStore.swift
//  homepwnr
//
//  Created by methos on 04.04.17.
//  Copyright © 2017 methos. All rights reserved.
//

import Foundation
import UIKit

class ImageStore {
    

    
    //  работа с кэшем
    //  не путать с сохранением на диск
    
    let cache = NSCache<NSString,UIImage>()
    
    
    //  NSString - objective-C version of String
    //  почему так ? 
    //  потомучто NSCache - класс, написанный на objective-c
    
    
    //  adding
    func setImage(_ image: UIImage, forKey key: String) {
        
        cache.setObject(image, forKey: key as NSString)
        
        
    }
    
    //  retrieving
    func image(forKey key: String) -> UIImage? {
        
        return cache.object(forKey: key as NSString)
        
    }
    
    //  deleting
    func deleteImage(forKey key: String) {
        
        cache.removeObject(forKey: key as NSString)
        
    }
    
    
}
