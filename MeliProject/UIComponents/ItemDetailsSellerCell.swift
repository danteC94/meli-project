//
//  ItemDetailsSellerCell.swift
//  MeliProject
//
//  Created by dante on 04/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

public class ItemDetailsSellerCell: UICollectionViewCell {
    struct ViewData {
        let transactions: Int?
        let transactionsCompleted: Int?
        let transactionsCanceled: Int?
        let positiveRating: Float?
    }
    var viewData: ViewData?{
        didSet {
            guard let viewData = viewData else { return }
            self.setUpComponentData(viewData: viewData)
        }
    }
    var stars: [UIImageView]?

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    @IBOutlet weak var ratingsTitle: UILabel!
    @IBOutlet weak var transactionsTitle: UILabel!
    @IBOutlet weak var transactionsValue: UILabel!
    @IBOutlet weak var transactionsCompletedTitle: UILabel!
    @IBOutlet weak var transactionsCompletedValue: UILabel!
    @IBOutlet weak var transactionsCanceledTitle: UILabel!
    @IBOutlet weak var transactionsCanceledValue: UILabel!

    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.stars = [firstStar, secondStar, thirdStar, fourthStar, fifthStar]
        self.setUpComponentStyles()
    }

    func setUpComponentStyles() {
        self.title.font = Styles.mainTitleFont
        self.title.textColor = Styles.mainTitleColor
        self.ratingsTitle.font = Styles.titleFont
        self.transactionsTitle.font = Styles.subtitleFont
        self.transactionsValue.font = Styles.descriptionFont
        self.transactionsValue.textColor = Styles.importantDescriptionColor
        self.transactionsCompletedTitle.font = Styles.subtitleFont
        self.transactionsCompletedValue.font = Styles.descriptionFont
        self.transactionsCompletedValue.textColor = Styles.importantDescriptionColor
        self.transactionsCanceledTitle.font = Styles.subtitleFont
        self.transactionsCanceledValue.font = Styles.descriptionFont
        self.transactionsCanceledValue.textColor = Styles.importantDescriptionColor
        _ = self.stars?.map { $0.image = UIImage(systemName: "star") }
    }

    func setUpComponentData(viewData: ViewData) {
        self.title.text = "Datos del vendedor"
        self.ratingsTitle.text = "Calificaciones"
        if let transactions = viewData.transactions {
            self.transactionsTitle.text = "Cantidad de ventas"
            self.transactionsValue.text = String(transactions)
        }
        if let transactionsCompleted = viewData.transactionsCompleted {
            self.transactionsCompletedTitle.text = "Cantidad de ventas exitosas"
            self.transactionsCompletedValue.text = String(transactionsCompleted)
        }
        if let transactionsCanceled = viewData.transactionsCanceled {
            self.transactionsCanceledTitle.text = "Cantidad de ventas canceladas"
            self.transactionsCanceledValue.text = String(transactionsCanceled)
        }
        self.setRatingStars(ratingValue: viewData.positiveRating)
    }

    func setRatingStars(ratingValue: Float?) {
        guard var ratingValue = ratingValue else { return }
        for i in 0...4 {
            if ratingValue - 0.2 >= 0 {
                self.stars?[i].image = UIImage(systemName: "star.fill")
                ratingValue -= 0.2
            } else if ratingValue - 0.1 >= 0 {
                self.stars?[i].image = UIImage(systemName: "star.lefthalf.fill")
                ratingValue -= 0.1
            }
        }
    }
}
