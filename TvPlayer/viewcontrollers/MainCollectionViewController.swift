//
//  MainCollectionViewController.swift
//  TvPlayer
//
//  Created by Shubham Garg on 04/04/18.
//  Copyright © 2018 SHUBHAM GARG. All rights reserved.
//

import UIKit
import Foundation
import AVKit
import SDWebImage

class MainCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    private var data:Array<[String: Any]>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let json = AppUtils.convertToDictionary()
        data = json!["data"] as? Array<[String: Any]>
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1;
        }
        if data == nil {
            return 0
        }
        return (data?.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if indexPath.section == 0 {
            return cell
        }
        else{
            let url : String = ((data?[indexPath.row]["pictures"] as! [String: Any])["sizes"] as! Array<[String: String]>)[3]["link"]!
        
            cell.featuredImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage.gifImageWithName("video-preview"))

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-50);
        }
        return CGSize(width: (UIScreen.main.bounds.width/3)-10, height: UIScreen.main.bounds.height/4);
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, 
             didSelectItemAt indexPath: IndexPath) {

        let playerVC = PlayerViewController()
        playerVC.urlString = (data?[indexPath.row]["files"] as! Array<[String: String]>)[0]["link"]
        playerVC.playVideo()
        self.navigationController?.pushViewController(playerVC, animated: true)
    }
    
}
