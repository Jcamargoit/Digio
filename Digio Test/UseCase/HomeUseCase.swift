//
//  HomeUseCase.swift
//  Digio Test
//
//  Created by Juninho on 10/05/22.
//

import UIKit

class HomeUseCase {
    static var Get:  Resource<HomeResultCodable> = {
        guard let url = URL(string: Constants.API.baseUrl) else {
            fatalError("URL is incorrect!")
        }
        return Resource<HomeResultCodable>(url: url)
    }()
}
