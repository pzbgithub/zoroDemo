//
//  ViewController.swift
//  Demo
//
//  Created by zoro on 2020/8/14.
//  Copyright © 2020 zoro. All rights reserved.
//

import UIKit

class IntegerReference {
    var value = 10
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        
        testCollections()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(SecondController(), animated: true)
    }
    
    // 闭包
    func closure() {
        let studname = {print("test")}
        studname()
        
        //--------
        let divide = { (val1: Int, val2: Int) -> Int in
            return val1 / val2
        }
        let result = divide(200, 20)
        print(result)
        
        //--------
        let names = ["AT", "AE", "D", "S", "BE"]
        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        let reversed = names.sorted(by: backwards(s1:s2:))
        print(reversed)
        
        //--------
        let names2 = ["AT", "AE", "D", "S", "BE"]
        let reversed2 = names2.sorted(by: { $0 > $1 })
        print(reversed2)
        
        //--------
        let names3 = ["AT", "AE", "D", "S", "BE"]
        let reversed3 = names3.sorted(by: >)
        print(reversed3)
        
        //--------
        let name4 = ["AT", "AE", "D", "S", "BE"]
        let reversed4 = name4.sorted() { $0 > $1 } // 尾随闭包
        print(reversed4)
        
        //--------
        func makeIncrementor(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            print("\(runningTotal)")
            func incrementor() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementor
        }
        let increment = makeIncrementor(forIncrement: 10)
        print(increment())
        print(increment())
    }
    
    // Collections
    func testCollections() {
        var nums = [1,2,3,4,5]
        let numsCopy = nums
        nums[0] = 200
        print(nums)
        print(numsCopy)
        
        //--------------
        let hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 18]
        let leastHue = hues.min { a, b in a.value < b.value }
        print(leastHue as Any)
        
        //------------
        let numbers = [10, 20, 30, 40, 50, 60]
        print(numbers.dropFirst())
    }
    
}




