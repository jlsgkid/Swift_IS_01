//
//  DataViewController.swift
//  T
//
//  Created by 李金梁 on 2018/1/18.
//  Copyright © 2018年 李金梁. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        demo();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }
    
    func demo(){
        
        let x: Int? = 10
        let y: Int? = 20
        print(x!+y!)
    
        //instead if
        //(1)
        let str :String? = "Test"
        print((str ?? "") + "Hello") //三目运算
        //(2) if let (if the Value is nil) 无需解包
        let _name : String? = "LI"
        let _age : Int? = 33
        if let name = _name,
           let age = _age{
            print (name + String(age))
        }
        if var name = _name,
            let age = _age{
            name = "new Name"
            print (name + String(age))
        }
        //if(name == null) return
        guard let name = _name,
            let age = _age else{
                return;
        }
        print("---else if----")
        print (name + String(age))
        //switch
        demo2()
        //for
        demo3()
        //String
        demo4()
    }
    
    func demo2(){
        // has no break
        let num: String! = "aa"
        switch num {
        case "aa","bb":
            print("Good")
        case "cc":
            break
        default:
            print("No Good")
        }
    }
    
    func demo3(){
        //0,1,2,3,4
        for i in 0..<5{
            print(i)
        }
        //0,1,2,3,4,5
        for i in 0...5{
            print(i)
        }
        for i in (0...5).reversed(){
            //fan zhuan
            print(i)
        }
    }
    
    func demo4(){
        let str = "String Test"
        //String not NSString
        for c in str.characters{
            print(c)
        }
        //get string length (utf8 : hanzi 3 byte)
        let str2 = "Hello汉字"
        print(str2.lengthOfBytes(using: .utf8)) //13 ge
        //method 1
        print(str2.characters.count)   //7 ge  -> good method
        //method 2
        let ocStr = str2 as NSString
        print(ocStr.length)  //7 ge
        
        //字符串拼接
        let strA = "A"
        let strB = "B"
        let strC: String? = "C"
        let strPr1 = "\(strA)\(strB)\(strC ?? "")"
        print(strPr1)
        let strPr2 = strA + strB + strC!
        print(strPr2)
        
        //字符串格式转换
        let strD = String(format: "%02d:%02d:%02d", 1,2,3)
        print(strD)
        
    }

}

