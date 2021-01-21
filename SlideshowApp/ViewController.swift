//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 吉川亀勝 on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        
        
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //再生中か停止中かnilで判断
        if (timer == nil) {
        
            //遷移先のViewControllerを取得
            let next = segue.destination as? ReViewController
      
        //用意した遷移先の変数imageView2にimageViewを画像として渡す
            next?.imageView2 = self.imageView.image
            
        } else {
            
            
            //遷移先のViewControllerを取得
            let next = segue.destination as? ReViewController
      
        //用意した遷移先の変数imageView2にimageViewを画像として渡す
            next?.imageView2 = self.imageView.image
            
        timer.invalidate()

        // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
        timer = nil
            
            // ボタンの名前を再生に直す
            startButton.setTitle("再生", for: .normal)
            
            //UIButtonを有効化
            backButton.isEnabled = true
            
            //UIButtonを有効化
            nextButton.isEnabled = true
        
        }
        
    }
    
    //startButtonのoutlet接続（再生/停止の表示を切替するため）
    @IBOutlet weak var startButton: UIButton!
    
    //自動再生中に戻るボタンを押せなくする為
    @IBOutlet weak var backButton: UIButton!
    
    //自動再生中に進むボタンを押せなくする為
    @IBOutlet weak var nextButton: UIButton!
    
    //imageViewのoutlet接続（写真を表示する為）
    @IBOutlet weak var imageView: UIImageView!
    
    //next、backボタンで使う順番の格納
    let imageName = ["image4.jpg", "image5.jpg", "image6.jpg"]
    var changeImgNo = 0
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    // スライドショー画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "image4.jpg")!,
        UIImage(named: "image5.jpg")!,
        UIImage(named: "image6.jpg")!
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        //再生中か停止中かnilで判断
        if (timer == nil) {
        
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 0
        }
        let name = imageName[changeImgNo]
        imageView.image = UIImage(named: name)
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        //再生中か停止中かnilで判断
        if (timer == nil) {
        
        if changeImgNo == 0 {
            changeImgNo = 2
        } else if changeImgNo == 1 {
            changeImgNo = 0
        } else if changeImgNo == 2 {
            changeImgNo = 1
        }

        let name = imageName[changeImgNo]
        imageView.image = UIImage(named: name)
        }
        
    }
    
    @IBAction func slideButon(_ sender: Any) {
        //再生中か停止中かnilで判断
        if (timer == nil) {
            
            //再生時の処理
            
            //タイマーのセット
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
            //UIButtonを無効化
            backButton.isEnabled = false
            
            //UIButtonを無効化
            nextButton.isEnabled = false
            
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直す
            startButton.setTitle("再生", for: .normal)
            
            //UIButtonを有効化
            backButton.isEnabled = true
            
            //UIButtonを有効化
            nextButton.isEnabled = true
            
        }

    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
}


