//
//  Services.swift
//  MVVM- CryptoCrazy
//
//  Created by Mert İnan on 28.10.2022.
//

import Foundation

class Services {
    func downloadCurrency (url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
              let cryptoList = try?  JSONDecoder().decode([CryptoCurrency].self, from: data)
                completion(cryptoList )
                
                
            }
        }.resume()
    }
}
