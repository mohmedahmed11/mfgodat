//
//  api.swift
//  mfgodat
//
//  Created by iMac on 2018/12/16.
//  Copyright © 2018 numberOne. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON



func getAll(endUrl: String, onCompletion: ((Any?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
    
    Alamofire.request(endUrl, method: .get).responseJSON { response in
        switch response.result {
        case .success(let result):
            onCompletion?(result)
        case .failure(let err):
            print("\(err.localizedDescription)")
            onError?(err)
        }
    }
}

func dwonloadImage(endUrl: String, onCompletion: ((UIImage?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
    
    Alamofire.request(endUrl)
        .responseImage { response in
            switch response.result {
            case .success:
                if let image = response.result.value {
                    onCompletion?(image)
                }
            case .failure(let err):
                print("\(err.localizedDescription)")
                onError?(err)
            }
    }
}


class ImageLoader {
    
    private static let cache = NSCache<NSString, NSData>()
    
    class func image(for url: URL, completionHandler: @escaping(_ image: UIImage?) -> ()) {
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            
            if let data = self.cache.object(forKey: url.absoluteString as NSString) {
                DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
                return
            }
            
            guard let data = NSData(contentsOf: url) else {
                DispatchQueue.main.async { completionHandler(nil) }
                return
            }
            
            self.cache.setObject(data, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
        }
    }
    
}

