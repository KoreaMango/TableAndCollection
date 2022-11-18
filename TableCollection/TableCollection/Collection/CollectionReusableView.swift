//
//  CollectionReusableView.swift
//  TableCollection
//
//  Created by 강민규 on 2022/10/13.
//

import UIKit
import SnapKit

class CollectionReusableView: UICollectionReusableView {
    let footerView = {
        let view = UILabel()
        view.text = "Footer"
        view.textColor = .black
        return view
    }()
        
    let headerView = {
        let view = UILabel()
        view.text = "Header"
        view.textColor = .black
        return view
    }()
    
//    override func prepareForReuse() {
//        if reuseIdentifier == "foot" {
//            self.addSubview(footerView)
//            footerView.snp.makeConstraints { make in
//                make.center.equalToSuperview()
//            }
//        } else {
//            self.addSubview(headerView)
//            headerView.snp.makeConstraints { make in
//                make.center.equalToSuperview()
//            }
//        }
//    }
    
    
    
}

