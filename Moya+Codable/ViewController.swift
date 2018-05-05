//
//  ViewController.swift
//  Moya+Codable
//
//  Created by QY on 2018/3/31.
//  Copyright © 2018年 QY. All rights reserved.
//

import UIKit
import RxSwift
import RxMoya

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
}

// MARK: - Without RxSwift
extension ViewController {
    
    @IBAction private func coreMapObject() {
        
        ApiProvider.request(.moive("1764796")) { (result) in
            
            switch result {
                
            case let .success(response):
                
                do {
                    
                    let success = try response.mapObject(Movie.self)
                    print("Success...\(success)")
                } catch {
                    print(error)
                }
            case let .failure(error):
                print("Error...\(error)")
            }
        }
    }
    
   @IBAction private func coreMapArray() {
        
        ApiProvider.request(.moive("1764796")) { (result) in
            
            switch result {
                
            case let .success(response):
                
                do {
                    
                    let success = try response
                        .mapArray(Person.self, path: "directors")
                    print("Success...\(success)")
                } catch {
                    print(error)
                }
            case let .failure(error):
                print("Error...\(error)")
            }
        }
    }
}

// MARK: - With RxSwift
extension ViewController {
    
    @IBAction private func rxSwiftMapObject() {
        
        ApiProvider.rx.request(.moive("1764796"))
            .mapObject(Movie.self)
            .subscribe(onSuccess: {
                print("Success...\($0)")
            }) {
                print("Error...\($0)")
            }.disposed(by: disposeBag)
    }
    
    @IBAction private func rxSwiftMapArray() {
        
        ApiProvider.rx.request(.moive("1764796"))
            .mapArray(Person.self, path: "directors")
            .subscribe(onSuccess: {
                print("Success...\($0)")
            }) {
                print("Error...\($0)")
            }.disposed(by: disposeBag)
    }
}

// MARK: - MoyaProvider
extension ViewController {
    
    @IBAction private func providerMapObject() {
        
        ApiProvider.request(.moive("1764796"), objectModel: Movie.self, success: {
            print("Success...\($0)")
        }) {
            print("Error...\($0)")
        }
    }
    
    @IBAction private func providerMapArray() {
        
        ApiProvider.request(.moive("1764796"), arrayModel: Person.self, path: "directors", success: {
            print("Success...\($0)")
        }) {
            print("Error...\($0)")
        }
    }
}
