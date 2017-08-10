//
//  ViewProductCell.swift
//  testAPPjtt
//
//  Created by Артем Стратиенко on 10.08.17.
//  Copyright © 2017 Артем Стратиенко. All rights reserved.
//

import Foundation
import UIKit

class ViewProductCell: UITableViewCell {
    
    @IBOutlet weak var collections_name: UILabel!
    
    @IBOutlet weak var collections_Thumbnail: UIImageView!
    
    @IBOutlet weak var collections_title: UITextView!
    
    @IBOutlet weak var collections_upvotes: UITextField!
    
    @IBOutlet weak var collections_subscriber: UILabel!
    //    @IBOutlet weak var authorLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
