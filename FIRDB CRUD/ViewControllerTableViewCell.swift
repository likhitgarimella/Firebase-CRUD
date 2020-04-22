//
//  ViewControllerTableViewCell.swift
//  FIRDB CRUD
//
//  Created by Likhit Garimella on 22/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}   // #28
