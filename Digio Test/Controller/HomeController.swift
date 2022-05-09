//  HomeController.swift
//  Digio Test
//  Created by Juninho on 04/05/22.

import UIKit

class HomeController: UIViewController {

    var presentationView: HomeView = HomeView()

    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
