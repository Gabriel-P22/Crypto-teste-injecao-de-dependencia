import Foundation
import Resolver

// MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
  func fetch(
    with urlRequest: URLRequest,
    completion: @escaping (Result<Data, AppError>) -> Void
  )
}
// MARK: - NetworkService
class NetworkService {

//This is normal, don't use Resolve. This simple code.
  
//  private var session: URLSession
//
//  init(session: URLSession) {
//    self.session = session
//  }

//Now use Resolver
  
  @Injected private var session: URLSession
}

extension NetworkService:NetworkServiceProtocol {
	func fetch(with urlRequest: URLRequest, completion: @escaping (Result<Data, AppError>) -> Void) {
		guard urlRequest.httpMethod == "GET" else {
			completion(.failure(AppError.network(description: "Something went wrong! Please try again later.")))
			return
		}

		URLSession.shared.dataTask(with: urlRequest) { data, _, error in
			guard
        error == nil,
        let data = data
      else {
				completion(.failure(AppError.network(description: "Something went wrong! Please try again later.")))
				return
			}

			completion(.success(data))
		}
		.resume()
	}
}
