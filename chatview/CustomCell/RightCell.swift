//
//  Cell.swift
//  chatview
//
//  Created by Nirmal on 25/01/21.
//  Copyright © 2021 Nirmal. All rights reserved.
//

import UIKit

class RightCell: UITableViewCell {

    @IBOutlet weak var view_trailing: NSLayoutConstraint!
    @IBOutlet weak var view_leading: NSLayoutConstraint!
    @IBOutlet weak var messageContainerView: UIView!
    @IBOutlet weak var textMessageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageContainerView.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func configureCell(message: Message) {
        textMessageLabel.text = message.msg
    }
}
