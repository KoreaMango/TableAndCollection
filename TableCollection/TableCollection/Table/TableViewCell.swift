//
//  TableViewCell.swift
//  TableCollection
//
//  Created by 강민규 on 2022/10/12.
//

import UIKit

class TableViewCell: UITableViewCell {

    let lb : UILabel = {
        let label = UILabel()
        label.text = "Default"
        return label
    }()
    
    var isTen : Bool? {
        didSet {
            if isTen == true {
                self.backgroundColor = .red
            } else {
                self.backgroundColor = .clear
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setView()
        setConstraint()
        // Configure the view for the selected state
    }
    
    func setView(){
        self.addSubview(lb)
    }
    
    func setConstraint(){
        lb.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(10)
            make.leading.equalTo(self.snp.leading).inset(16)
            
        }
    }

}
