//
//  ViewController.swift
//  T
//
//  Created by 李金梁 on 2018/1/27.
//  Copyright © 2018年 李金梁. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    var text1: UITextField?
    var text2: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "Text:\(indexPath.row)"
        return cell
    }
    
    func setUpUI(){
        //1 create a table
        let tv = UITableView(frame: view.bounds, style: .plain)
        
        //2 add to View
        view.addSubview(tv)
        
        //3 注册可重用cell
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        //4 set dataSource
        tv.dataSource = self
        
        let btn = UIButton()
        btn.setTitle("Cal", for: UIControlState(rawValue: 0))
        btn.setTitleColor(UIColor.black, for: UIControlState(rawValue: 0))
        btn.sizeToFit()
        btn.center = view.center
        view.addSubview(btn)
        //delegate
        btn.addTarget(self, action: #selector(cal), for: .touchUpInside)
        
        //2018.1.28
        //面向对象class
        let p = Person()
        print(p.name)
        
    }
    
    func cal(){
        print("btn is clicked")
        print(#function)
        guard let _ = Int(text1?.text ?? ""),
            let _ = Int(text2?.text ?? "")else {
            print("format error")
            return
        }
    }

}
