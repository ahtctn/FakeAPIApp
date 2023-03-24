//
//  ProductModel.swift
//  FakeAPIApp
//
//  Created by Ahmet Ali ÇETİN on 24.03.2023.
//

import Foundation

struct ProductModel: Codable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating:  RatingModel
}

