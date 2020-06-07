//
//  DetailTableViewCell.swift
//  LookAround
//
//  Created by Baran on 7.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    let headerLabel = UILabelFactory(style: .detailHeader).build()
    let descrpLabel = UILabelFactory(style: .detailDescription).build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        contentView.backgroundColor = .cusBlack
        
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        contentView.addSubview(headerLabel)
        contentView.addSubview(descrpLabel)
    }
    
    func setConstraints() {
        headerLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(25)
            make.right.equalTo(contentView).offset(-20)
        }
        
        descrpLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerLabel).offset(80)
            make.right.equalTo(contentView).offset(-20)
            make.top.equalTo(23)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
    func setCell(data: DetailInfoModel){
        headerLabel.text = data.header
        descrpLabel.text = data.descp
    }
    
    
}
