//
//  WebService.swift
//  CryptoApp
//
//  Created by Nurşah on 23.12.2021.
//

import Foundation

class WebService {
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                }
                else if let data = data {
                    let cryp = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                    print(cryp)
                    
                    if let cryptoList = cryp {
                        completion(cryptoList)
                    }
                    
                }
                
            }.resume()
            
        }
}
