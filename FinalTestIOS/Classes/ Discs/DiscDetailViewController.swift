//
//  DiscDetailViewController.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/11/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import UIKit

class DiscDetailViewController: UIViewController {

    
    @IBOutlet weak var imgAlbum: UIImageView!
    @IBOutlet weak var lblAlbumName: UILabel!
    
    var objDisc: Disc!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.lblAlbumName.text = self.objDisc.disc_name ?? ""
        
        self.imgAlbum.downloadImagenInUrl(self.objDisc.disc_urlImage ?? "", withPlaceHolderImage: nil) { (_, imageDownloaded) in
            self.imgAlbum.image = imageDownloaded
        }
    }
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? AddModelViewController {
            controller.objBrand = self.objBrand
            
        }else if let controller = segue.destination as? ListModelViewController {
            controller.objBrand = self.objBrand
        }
    }*/

}
