//  APIService.swift
//  Digio Test

import UIKit
import RxSwift

enum NetworkError: Error {
    case decodingError // JASON MODEL
    case domainError // 500
    case urlError
    case unauthorized
    case serverError
}

enum HttpMethod: String {
    case get = "GET"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data?
}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}

class APIService {

    func load<T>(resource: Resource<T>) -> Observable<T> {
        return Observable<T>.create { observer in

            var request = URLRequest(url: resource.url)
            request.httpMethod = resource.httpMethod.rawValue

            URLSession.shared.dataTask(with: request) { data, response, error in

                // Perguntar pro Jardel
                // QUEBRA O COD SE NÃO TIVER INTERNET
                let nsHTTPResponse = response as! HTTPURLResponse
                let  statusCode = nsHTTPResponse.statusCode

                guard let data = data, error == nil else {
                    observer.onError(NetworkError.domainError)
                    return
                }
                let result = try? JSONDecoder().decode(T.self, from: data)

                if let result = result {
                    DispatchQueue.main.async {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                } else {
                    if statusCode == 401 {
                        observer.onError(NetworkError.unauthorized)
                        return
                    }
                    if statusCode == 404 {
                        observer.onError(NetworkError.urlError)
                        return
                    }
                    if statusCode == 500 {
                        observer.onError(NetworkError.serverError)
                        return
                    }
                    observer.onError(NetworkError.decodingError)
                }
            }.resume()
            return Disposables.create {}
        }
    }
}
