//
//  ViewController.swift
//  Moya+Codable
//
//  Created by QY on 2018/3/31.
//  Copyright © 2018年 QY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction private func ObjectBtnDidClick(_ sender: Any) {
        
        ApiProvider.request(.moive("1764796"), objectModel: Movie.self, success: {
            print("Success...\($0)")
        }) {
            print("Error...\($0)")
        }
    }
    
    @IBAction private func ArrayBtnDidClick(_ sender: Any) {
        
        ApiProvider.request(.moive("1764796"), arrayModel: Person.self, path: "directors", success: {
            print("Success...\($0)")
        }) {
            print("Error...\($0)")
        }
    }
}
