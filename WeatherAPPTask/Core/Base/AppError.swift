//
//  AppError.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation


enum AppError: Error {
    case invalidURL
    case invalidData
    case requestFailed
    case jsonConversionFailure
    case jsonParsingFailure
    case responseUnsuccessful
    case serverError
    case offline
    case timeout
    case badRequest
    case unauthorized
    case notFound
    case networkError
    case invalidResponse
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case .invalidURL:
            return "Invalid URL"
        case .invalidData:
            return "Invalid Data"
        case .requestFailed:
            return "Request Failed"
        case .jsonConversionFailure:
            return "JSON Conversion Failure"
        case .jsonParsingFailure:
            return "JSON Parsing Failure"
        case .responseUnsuccessful:
            return "Response Unsuccessful"
        case .serverError:
            return "Server Error"
        case .offline:
            return "The Internet connection appears to be offline."
        case .timeout:
            return "Request time out"
        case .badRequest:
            return "Bad Request"
        case .unauthorized:
            return "Unauthorized User"
        case .notFound:
            return "Destination Not Found"
        case .networkError:
            return "Internet Error"
        }
    }
    
    static func localizeError(statusCode: Int) -> AppError{
        
        switch statusCode {
        case 400:
            return AppError.badRequest
        case 401:
            return AppError.unauthorized
        case 404:
            return AppError.notFound
        case 408, -1001:
            return  AppError.timeout
        case -1009:
            return AppError.offline
        case 500:
            return AppError.serverError
        default:
            return AppError.networkError
        }
    }
}




enum  CustomError : String , Error {
    case invalidURL               = "Invalid URL"
    case invalidData              =  "Invalid Data"
    case requestFailed            = "Request Failed"
    case jsonConversionFailure    = "JSON Conversion Failure"
    case jsonParsingFailure       = "JSON Parsing Failure"
    case responseUnsuccessful     = "Response Unsuccessful"
    case serverError              = "Server Error"
    case offline                  = "Your are offline"
    case timeout                  = "Request time out"
    case badRequest               = "Bad Request"
    case unauthorized             = "Unauthorized User"
    case notFound                 = "Destination Not Found"
    case networkError             = "Internet Error"
}
