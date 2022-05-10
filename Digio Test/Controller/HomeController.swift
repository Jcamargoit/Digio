//  HomeController.swift
//  Digio Test
//  Created by Juninho on 04/05/22.

import UIKit

class HomeController: UIViewController {

    var presentationView: HomeView = HomeView()
    private var viewModel: HomeViewModel = HomeViewModel()

    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupApi()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
