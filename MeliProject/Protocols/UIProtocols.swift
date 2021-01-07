//
//  UIProtocols.swift
//  MeliProject
//
//  Created by dante on 06/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import Foundation

protocol ViewDataCompliant {
    associatedtype ViewData
    /// The viewData represents an object which is intended to give a data entry point
    /// for a UI class, such as View Controllers, Collection View Cells,
    /// Table View Cells, etc that should display data on the user interface.
    /// The intention of this approach is to avoid having a lot of variables
    /// spread out on UI classes which can update the user interfaz,
    /// this makes easier to find out where the data is setted, more consistency
    /// and also makes the code cleaner.
    var viewData: ViewData? { get set }
}
