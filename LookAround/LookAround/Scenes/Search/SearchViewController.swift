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
    private let tableView = UITableViewFactorcy(style: .base).build()
    
    var array: [String] = []
    var presenter: SearchPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        presenter.load()
    }
    
    func configure() {
        addSubViews()
        setConstraints()
        setTableView()
        hideKeyboard()
    }

    func addSubViews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        searchBar.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(searchBar).offset(55)
        }
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

// MARK: - TableViewDelegete
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

// MARK: - TableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if array.count == 0 {
            tableView.setEmptyView(title: "Your around look like empty", message: "Lets search")
        } else {
            tableView.restore()
        }
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.headerLabel.text = "121231231231231231231231231231231231231231231233"
        cell.descrpLabel.text = "dalnkadskldndalnkadskldndalnkadskldndalnkadskldndalnkadskldn"
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: SearchViewProtocol
extension SearchViewController: SearchViewProtocol {
    
    func handleOutput(_ output: SearchPresenterOutPut) {
        switch output {
        case .showPlaces(let data):
            array = data
            tableView.reloadData()
        }
    }
    
}
