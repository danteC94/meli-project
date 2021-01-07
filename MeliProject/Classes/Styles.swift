//
//  Styles.swift
//  MeliProject
//
//  Created by dante on 05/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

/**
Singleton which contains all the fonts and colors used on the app.
*/

public struct Styles {
    static let mainTitleFont: UIFont = .boldSystemFont(ofSize: 32)
    static let titleFont: UIFont = .boldSystemFont(ofSize: 26)
    static let smallTitleFont: UIFont = .boldSystemFont(ofSize: 20)
    static let subtitleFont: UIFont = .systemFont(ofSize: 18)
    static let bodyFont: UIFont = .systemFont(ofSize: 16)
    static let descriptionFont: UIFont = .systemFont(ofSize: 16)

    static let mainTitleColor: UIColor = UIColor.black
    static let titleColor: UIColor = UIColor.blue
    static let descriptionColor: UIColor = UIColor.gray
    static let importantDescriptionColor: UIColor = UIColor.init(red: 0, green: 150/255, blue: 0, alpha: 1)
    static let navigationBackgroundColor: UIColor = UIColor.yellow
    static let buttonColor: UIColor = UIColor.init(red: 0, green: 70/255, blue: 255/255, alpha: 1)
    static let buttonWidthBackgroundColor: UIColor = .white
}
