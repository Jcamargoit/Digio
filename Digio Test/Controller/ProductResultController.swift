//
//  ProductResultController.swift
//  Digio Test
//
//  Created by Juninho on 10/05/22.
//

import UIKit

class ProductResultController: UIViewController {
    var presentationView: ProductResultView = ProductResultView()

    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
