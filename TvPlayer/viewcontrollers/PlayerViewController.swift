//
//  PlayerViewController.swift
//  TvPlayer
//
//  Created by Shubham Garg on 04/04/18.
//  Copyright © 2018 SHUBHAM GARG. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController, AVPlayerViewControllerDelegate  {
    var urlString:String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Play video using Av player
    func playVideo() {
        player = AVPlayer(url: NSURL(string: urlString!)! as URL)
        player?.play()
    }
    

}


