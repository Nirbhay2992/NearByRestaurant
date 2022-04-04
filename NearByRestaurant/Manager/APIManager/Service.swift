//
//  Service.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

class Service: ServiceProtocol {
        
    func execute(request: RequestProtocol, _ completion: NetworkCompletion?) {
    
        guard let urlString = EndPointUtility.url(endPoint: request.route),
              let url = URL(string: urlString)
        else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error)
                completion?(nil,error)
            }
            guard let data = data else { return }
            
            self.handleResponse(request, data: data) { response, error in
                completion?(response,error)
            }
            
        }
        task.resume()

    }
    
    func handleResponse(_ forRequest: RequestProtocol, data: Data, _ completion: NetworkCompletion?) {
     
        let response = Response(type: .success, request: forRequest, data: data)
        completion?(response,nil)
    }
    
}
