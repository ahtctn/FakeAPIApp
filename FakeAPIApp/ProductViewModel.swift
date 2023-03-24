//
//  ProductViewModel.swift
//  FakeAPIApp
//
//  Created by Ahmet Ali ÇETİN on 24.03.2023.
//

import Foundation

final class ProductViewModel {
    
    let products: [ProductModel] = []
    var eventHandler: ((_ event: Event) -> Void)? // DATA BINDING CLOSURE
     
    
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading )
            switch response {
            case .success(let products):
                self.eventHandler?(.dataLoaded)
                print(products)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ProductViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
    
}
