//
//  ProductDetailsViewController.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    struct ViewData {
        let item: ItemImmutableModel
    }

    var viewData: ViewData? {
        didSet {
            DispatchQueue.main.async {
                // Make UI updates
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
