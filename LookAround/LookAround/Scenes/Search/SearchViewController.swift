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
    
    var resultArray = [MapInfoModel]()
    var presenter: SearchPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        presenter.load()
    }
    
    func configure() {
        addSubViews()
        setConstraints()
        setComponentsThings()
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
    
    func setComponentsThings() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        searchBar.delegate = self
    }
    
}

// MARK: - TableViewDelegete
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = resultArray[indexPath.row]
        presenter.goMap(selected: selected)
    }
    
}

// MARK: - TableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultArray.count == 0 {
            tableView.setEmptyView(title: "Your around look like empty", message: "Lets search")
        } else {
            tableView.restore()
        }
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.setCell(data: resultArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.goSearch(text: searchBar.text ?? "")
    }
    
}

// MARK: SearchViewProtocol
extension SearchViewController: SearchViewProtocol {
    
    func handleOutput(_ output: SearchPresenterOutPut) {
        switch output {
        case .showPlaces(let data):
            resultArray = data
            tableView.reloadData()
        }
    }
    
}
