//
//  ProductDecorators.swift
//  SportsStore
//
//  Created by jumpei on 2017/03/23.
//  Copyright © 2017年 Apress. All rights reserved.
//

import Foundation

class PriceDecorator: Product {
    fileprivate let wrappedProduct: Product

    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        fatalError("Not Supported")
    }

    init(product: Product) {
        self.wrappedProduct = product
        super.init(name: product.name, description: product.productDescription, category: product.category, price: product.price, stockLevel: product.stockLevel)
    }
}

class LowStockIncreaseDecorator: PriceDecorator {
    override var price: Double {
        var price = self.wrappedProduct.price
        if stockLevel <= 4 {
            price = price * 1.5
        }
        return price
    }
}

class SoccerDecreaseDecorator: PriceDecorator {
    override var price: Double {
        return super.wrappedProduct.price * 0.5
    }
}
