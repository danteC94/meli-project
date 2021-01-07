//
//  WebViewController.swift
//  MeliProject
//
//  Created by dante on 06/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, ViewDataCompliant {

    // MARK: Structs

    struct ViewData {
        let url: URL
    }

    // MARK: Attributes

    let webView = WKWebView()
    var viewData: ViewData? {
        didSet {
            if let url = viewData?.url {
                let request = URLRequest(url: url)
                self.webView.load(request)
            }
        }
    }

    // MARK: Overrides
    
    public override func loadView() {
        self.view = webView
    }
}
