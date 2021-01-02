//
//  ProductListViewController.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

protocol ProductListViewControllerDelegate {
    func productListVCDidSelectItem(itemId: String)
}

public class ProductListViewController: UIViewController {

    struct ViewData {
        let items: [ItemImmutableModel]
    }

    var viewData: ViewData? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    var delegate: ProductListViewControllerDelegate?

    @IBOutlet weak var tableView: UITableView!

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register((UINib(nibName: "ItemTableViewCell", bundle: nil)), forCellReuseIdentifier: "ItemTableViewCell")
    }
}

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData?.items.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
            assertionFailure("Could not dequeue cell for row \(indexPath.row) in table view")
            return UITableViewCell()
        }
        guard let item = self.viewData?.items[indexPath.row] else {
            assertionFailure("No Item for row \(indexPath.row) in table view")
            return UITableViewCell()
        }

        let cellViewData = ItemTableViewCell.ViewData(title: item.title,
                                                      thumbnailURL: "",
                                                      price: item.price,
                                                      freeShipping: item.shipping?.freeShipping)
        cell.viewData = cellViewData
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let itemId = self.viewData?.items[indexPath.row].id else {
            assertionFailure("No Item for row \(indexPath.row) in table view")
            return
        }
        self.delegate?.productListVCDidSelectItem(itemId: itemId)
    }
}
