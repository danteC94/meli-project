//
//  UINib+Extensions.swift
//  MeliProjectTests
//
//  Created by dante on 05/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

extension UINib {
    static func getNib(for nib: AnyClass) -> Any? {
        let bundle = Bundle(for: nib)
        let viewName = String(describing: nib)
        let nib = bundle.loadNibNamed(viewName, owner: nil)!.first
        return nib
    }
}
