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
    }
    
    func switchDemo(){
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
    
    func forDemo(){
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
    
    func stringDemo(){
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
        
        let strE = "aasdfgc"
        let ocS1 = strE as NSString
        let s1 = ocS1.substring(to: 3)
        print((s1))
    }
    
    //2018.1.27
    func arrayDemo(){
        
        //--不可变--
        let p = CGPoint(x: 10, y: 10)
        let array = [p]
        print(array) //[(10.0, 10.0)]
        //NSObject <-> AnyObject(one class can has no parent class)
        
        //array.removeAll()
        let arrayInt = [11,22,33,44,55,66,77,88,99,10]
        //1
        for i in 0..<arrayInt.count{
            print(arrayInt[i])
        }
        //2
        for item in arrayInt{
            print(item)
        }
        //3 元组 （同时遍历下标和内容）
        for e in array.enumerated(){
            print(e)
            //e.offset e.element
        }
        //4
        for item in arrayInt.reversed(){
            print(item)
        }
        //5 reversed
        for (n,s) in arrayInt.enumerated().reversed(){
            print("\(n) \(s)")
        }
        
        //let array = [p]
        var arrayStr = ["w","e","r"]
        arrayStr.append("q")
        arrayStr.remove(at: 1)
        //delete the array and keep the capacity
        arrayStr.removeAll(keepingCapacity: true)
        print(arrayStr.capacity)
        //var array1 = [Int]()
        
    }
    
    func DictionaryDemo(){
        //key-value
        var dict = ["name":"LI","sex":"man"]
        print(dict)
        //定义字典的数组 这个在开发中用到的最多
        let array: [[String: String]] = [
           ["name": "LI","sex":"man"],
           ["name": "ZHANG","sex":"man"]
        ]
        print(array) //[["name": "LI", "sex": "man"], ["name": "ZHANG", "sex": "man"]]
        dict["YANG"] = "woman"
        //<#T##Hashable#>: delete by key
        //hash:  String -> int (only one) which is used for search
        dict.removeValue(forKey: "sex")
        for (key,value) in dict{
            print("\(key) \(value)")
        }
        for key in dict.keys{
            print(key)
        }
        var namesOfIntegers = [Int: String]()
        namesOfIntegers[16] = "sixteen"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //arrayDemo();
        DictionaryDemo()
    }
    
    //数据源的方式不同
    //tableView 必须要继承UITableViewDataSource后重写func tableView
    //collectionView 必须要继承UICollectionViewController 后实现父类的collectionView
    //override func collectionView

}

