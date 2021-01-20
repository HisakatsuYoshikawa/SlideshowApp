//
//  2ViewController.swift
//  SlideshowApp
//
//  Created by 吉川亀勝 on 2021/01/06.
//

import UIKit



class ReViewController: UIViewController {
    
    //imageviewのoutlet接続
    @IBOutlet weak var zoom: UIImageView!
    
    //遷移元から画像を受け取るための宣言
    var imageView2: UIImage!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
                
        //imageView2に画像を表示する
        zoom.image = self.imageView2

        
        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
