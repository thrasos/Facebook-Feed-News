//
//  FBCell.swift
//  FacebookFeed
//
//  Created by Thrasos Nerantzis on 22/01/2018.
//  Copyleft © 2018 Thrasos. All rights reserved.
//

import UIKit

class FBCell: UITableViewCell {
    
    @IBOutlet weak var FBpostTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FBpostTitle.sizeToFit()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
