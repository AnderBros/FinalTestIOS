//
//  DiscTableViewCell.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/8/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import UIKit

class DiscTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNameDisc: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    
    var objDisc: Disc!{
        didSet{
            self.updateData()
        }
    }
    
    func updateData() {
        
        self.lblNameDisc.text = self.objDisc.disc_name ?? ""
        self.lblArtist.text = self.objDisc.disc_artist ?? ""
    }

}
