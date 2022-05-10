//  APIService.swift

import UIKit

enum NetworkError: Error {
    case decodingError // JASON MODEL
    case domainError // ErrO 500
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
    var body: Data? = nil
}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}

class APIService {

    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in

            // Perguntar pro Jardel
          let nsHTTPResponse = response as! HTTPURLResponse
          let  statusCode = nsHTTPResponse.statusCode

            let contents = String(data: data!, encoding: .utf8)
            print("meu status contents ", contents ," body ", resource.body , " Status ", statusCode)

            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)

            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                if statusCode == 401 {
                    completion(.failure(.unauthorized))
                    return
                }
                if statusCode == 404 {
                    completion(.failure(.urlError))
                    return
                }
                if statusCode == 500 {
                    completion(.failure(.serverError))
                    return
                }
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
