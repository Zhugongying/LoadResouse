//
//  AccountManager.swift
//  LoadResouse
//
//  Created by zhugy on 2017/3/16.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

import UIKit

class AccountManager {
    static let `default` = AccountManager()
    
    private(set) var username: String?
    
    func login(username: String, account: ((String) -> Void)? = nil){
        account?("ss")
    }
}

class Test {
    init() {
        
    }
    
    func test() {
        let newDemo = NewDemo(name: "sssss")
        let p = newDemo
        p.name = "sssss"
        
        
        
        let s: StructDemo = StructDemo(name: "33334", age: 12)
    
    }
    
   
    
}

struct StructDemo {
    var name: String
    var age: Int
}

class Demo {
    var name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func say() {
    
    }
    
}

class NewDemo: Demo {
    convenience init(name: String) {
        self.init(name: name, age: 1)
    }
    
    override func say() {
        super.say()
    }
}
