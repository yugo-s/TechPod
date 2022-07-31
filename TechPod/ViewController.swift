//
//  ViewController.swift
//  TechPod
//
//  Created by 坂口 友吾 on 2022/07/31.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

//    StoryBoardでTabViewを宣言
    @IBOutlet var table:UITableView!
     
    var songNameArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        テーブルビューのデータソースメゾットはViewcontrollerクラスに書くよ、という設定
        table.dataSource = self
        
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        // Do any additional setup after loading the view.
    }
    
    
//    セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
        
        
    }
    
    
//    ID付きのセルを取得して、セル付属のtextlabelに「テスト」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        return cell!
        
    }

    
}

