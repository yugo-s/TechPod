//
//  ViewController.swift
//  TechPod
//
//  Created by 坂口 友吾 on 2022/07/31.
//

import UIKit
import AVFoundation





class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

//    StoryBoardでTabViewを宣言
    @IBOutlet var table:UITableView!
     
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    
    var imageNameArray = [String]()
    
    var audioPlayer : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        テーブルビューのデータソースメゾットはViewcontrollerクラスに書くよ、という設定
        table.dataSource = self
        
//        テーブルビューのデリゲートメゾットはViewControllerメゾットに書くよ、という設定
        table.delegate = self
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        fileNameArray = ["cannon", "elise", "aria"]
        
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
        
        
        
        
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
        
        
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer = try?AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
        
        
    }
    
}

