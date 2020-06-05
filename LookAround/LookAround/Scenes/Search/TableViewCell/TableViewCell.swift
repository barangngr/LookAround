//
//  TableViewCell.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    let headerLabel = UILabelFactory(style: .cellHeader).build()
    let descrpLabel = UILabelFactory(style: .cellDescription).build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        contentView.backgroundColor = .cusGray
        
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        contentView.addSubview(headerLabel)
        contentView.addSubview(descrpLabel)
    }
    
    func setConstraints() {
        headerLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(20)
            make.right.equalTo(contentView).offset(-20)
        }
        
        descrpLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerLabel)
            make.right.equalTo(contentView).offset(-20)
            make.top.equalTo(headerLabel).offset(25)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
    func setCell(data: String){
        headerLabel.text = data
        descrpLabel.text = data
    }
    
    
}
