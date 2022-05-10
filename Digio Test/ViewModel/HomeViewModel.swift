//  ViewModel.swift
//  Digio Test

import UIKit

class HomeViewModel {

    private var model: HomeModel = HomeModel()
    var codableResultHome: HomeResultCodable?

    func setupApi() {APIService().load(resource: HomeUseCase.Get) { [] result in
            switch result {
            case .success(let orders):

                self.codableResultHome = orders
                print("Sucesso!!!", orders)
            case .failure(let error):
                print("Error ", error)
            }
        }
    }
}
