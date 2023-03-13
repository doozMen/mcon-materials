import Foundation
import SwiftCommand

extension String: Swift.Error { }


#if canImport(FoundationNetworking)
extension URLSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation{ continuation in
            self.dataTask(with: request) { data, response, error in
                switch (data, response, error) {
                    case (_, _, .some(let error)):
                        continuation.resume(throwing: error)
                    case let ( .some(data), .some(response), _):
                        continuation.resume(returning: (data, response))
                        return
                    case (_, nil, _), (nil, _, _):
                        continuation.resume(throwing: "invalid")
                }
            }
        }
    }
}
#endif
