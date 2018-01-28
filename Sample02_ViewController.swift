//
//  Sample02_ViewController.swift
//  T
//
//  Created by 李金梁 on 2018/1/27.
//  Copyright © 2018年 李金梁. All rights reserved.
//

import UIKit

class Sample02_ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //外部参数使用  _存在的话会忽略形参的名字
    func sum(_ x: Int, _ y: Int) -> Int  {
        return x + y
    }
    func sum2(_ x: Int = 1, _ y: Int = 2) -> Int  {
        return x + y
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sum(10,20))
        //sum(x: 10, y: 20)
        
        //闭包
        //使用场景：
        //（1）异步执行完成回调
        //（2）控制器间的回调
        //（3）自定义视图的回调
        //解释：
        //1提前准备好代码 2需要的时候调用 3可以当作参数传递
        let f = sum2
        print(f(10,50))
        
        //1.最简单闭包 使用常量记录函数
        let b1 = {
            print("Hello")
        }
        b1()
        
        //2.带参数闭包
        //形参列表->返回值类型 需要添加一个关键字 in 分隔定义和实现
        //(Int) -> ()
        let b2 = { (x: Int) -> () in
            print(x)
        }
        b2(100)
        
        //3.带参数 & 返回值的闭包
        let b3 = { (x: Int) -> Int in
            return x + 100
        }
        print(b3(100))
        
        //尾随闭包
        loadData() { (result) in
            print(result)
        }
        //解决循环引用
//        loadData{
//            [weak self] in
//            print(self?.view)
//        }
    }
    
    //GCD 任务调度机制 队列调度任务（block/闭包），以同步/异步的方式执行
    func loadData(comp: @escaping (_ result: [String])->()) -> (){
        DispatchQueue.global().async {
            print("take time: \(Thread.current)")
            //休眠
            Thread.sleep(forTimeInterval: 1.0)
            
            let json = ["name","age","sex"]
            
            //主线程回调
            DispatchQueue.main.async(execute: {
                print("Main UI Thread: \(Thread.current)")
                //回调->执行 闭包（通过参数传递）
                comp(json)
            })
        }
    }

    

}
