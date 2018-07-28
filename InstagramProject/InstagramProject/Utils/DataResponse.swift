//
//  DataResponse.swift
//  InstagramProject
//
//  Created by seob on 2018. 7. 28..
//  Copyright © 2018년 seob. All rights reserved.
//

import Alamofire

extension DataResponse {
    
    /// `Result`의 값을 가지고 만든 새로운 `Result`를 사용하는 `DataResponse`를 반환합니다.
    func flatMap<T>(_ transform: (Value) -> Result<T>) -> DataResponse<T> {
        let result: Result<T>
        switch self.result {
        case .success(let value):
            result = transform(value)
        case .failure(let error):
            result = .failure(error)
        }
        return DataResponse<T>(
            request: self.request,
            response: self.response,
            data: self.data,
            result: result,
            timeline: self.timeline
        )
        
    }
    
    // MARK - errorInfo
    func errorInfo() -> (message: String?, field: String?)? {
        guard let data = self.data,
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
            let error = json["error"] as? [String: Any]
            else { return nil }
        let message = error["message"] as? String
        let field = error["field"] as? String
        return (message: message, field: field)
    }
    
    
    
}
