//
//  DetailViewController.swift
//  LookAround
//
//  Created by Baran on 6.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let tableView = UITableViewFactorcy(style: .detail).build()
    
    var data: MapInfoModel!
    var tableViewData = [DetailInfoModel]()
    
    var presenter: DetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        presenter.setData(data: data)
    }
    
    func configure() {
        addSubViews()
        setConstraints()
        setComponentsThings()
    }
    
    func addSubViews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.bottom.equalTo(view)
        }
    }
    
    func setComponentsThings() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

// MARK: - TableViewDelegete
extension DetailViewController: UITableViewDelegate {
}

// MARK: - TableViewDataSource
extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        cell.setCell(data: tableViewData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: SearchViewProtocol
extension DetailViewController: DetailViewProtocol {
    
    func handleOutput(_ output: DetailPresenterOutPut) {
        switch output {
        case .showDetails(let data):
            tableViewData = data
            self.tableView.reloadData()
        }
    }
    
}
