//  ViewModel.swift
//  Digio Test

import UIKit
import RxSwift

protocol HomeViewModelDelegate: AnyObject {
    func successRequest()
    func failureRequest(_ error: Error)
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    var disposable: DisposeBag = DisposeBag()
    
    private var model: HomeModel = HomeModel()
    var codableResultHome: HomeResultCodable?
    
    func setupApi() {
        APIService().load(resource: HomeUseCase.Get).asObservable()
            .subscribe(
                onNext: { result in
                    print("Sucesso!!!", result)
                    self.codableResultHome = result
                    self.delegate?.successRequest()
                },
                onError: { error in
                    print("Error ", error)
                    self.delegate?.failureRequest(error)
                }).disposed(by: disposable)
    }
}
