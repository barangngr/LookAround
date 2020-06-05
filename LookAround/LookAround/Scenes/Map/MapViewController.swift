//
//  MapViewController.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    var presenter: MapPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
}

// MARK: MapViewProtocol
extension MapViewController: MapViewProtocol {
    
    func handleOutput(_ output: MapPresenterOutPut) {
        //print("123")
    }
    
}
