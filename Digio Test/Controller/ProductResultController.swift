//  ProductResultController.swift
//  Digio Test

import UIKit

class ProductResultController: UIViewController {

    // MARK: - Variable And Constants
    var presentationView: ProductResultView = ProductResultView()

    // MARK: - Lifecycle
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.showLoading(enable: false)
    }

    // MARK: - Func
}

// MARK: - Extension ProductResultController
