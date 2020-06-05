//
//  SearchViewController.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let searchBar = UISearchBarFactory(style: .base).build()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cusBlack
        hideKeyboard()
        
        setConstraint()
    }

    func setConstraint() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        //getPlace()
    }
    
//    func getPlace() {
//        service.request(.getSearch(title: "şükrüsaraç")) { (result) in
//            switch result {
//            case .success(let response):
//                print(response.statusCode)
//                let jsonDict = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
//                print("json == \(jsonDict)")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

}
