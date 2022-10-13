//
//  CollectionViewCell.swift
//  TableCollection
//
//  Created by 강민규 on 2022/10/12.
//

import UIKit
import SnapKit



class CollectionViewCell: UICollectionViewCell {
    let lb : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        initConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.contentView.addSubview(lb)
        self.contentView.backgroundColor = .red
    }
    
    func initConstraint(){
        lb.snp.makeConstraints { make in
            make.center.equalTo(self.contentView.snp.center)
        }
    }
}
