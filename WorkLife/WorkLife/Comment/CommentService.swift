//
//  LoginService.swift
//  WorkLife
//
//  Created by 조세연 on 6/15/24.
//

import Foundation

class CommentService {
    static let shared = CommentService()
    private init() {}
    
    
    func makeRequestBody(item_id: String, comment: String) -> Data? {
        do {
            let data = CommentRequestBody(item_id: item_id, comment: comment)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    
    func makeRequest(body: Data?) -> URLRequest {
        
        let url = URL(string: "http://localhost:8000/writeComment")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
//    func PostLoginData(item_id: String, comment: String) async throws -> [CommentModel] {
//        do {
//            guard let body = makeRequestBody(item_id: item_id, comment: comment)
//            else {
//                throw NetworkError.requstEncodingError
//            }
//            
//            let request = self.makeRequest(body: body)
//            let (data, response) = try await URLSession.shared.data(for: request)
//            
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print(response)
//                throw NetworkError.responseError
//            }
//            
////            let decodedResponse = try JSONDecoder().decode(CommentResponse.self, from: data)
////            return decodedResponse.
//
//            
//        } catch {
//            print("에러세요: \(error)")
//            throw error
//        }
//    }

    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}

