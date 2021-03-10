//
//  SellingList.swift
//  MarketPlace
//
//  Created by Ashish-Ritish on 4/7/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//

import SwiftUI

struct SellingList: View {
    @ObservedObject private var products = FirebaseCollection<Product>(collectionRef: productsCollectionRef)
    var body: some View {
        VStack{
            
            if(products.items.filter{ $0.addBy == uid! && $0.soldTo.isEmpty}.count > 0){
                ProductsCollectionView(products: self.products.items.filter{$0.addBy == uid! && $0.soldTo.isEmpty})
            }else{
                noProduct(message: "You don't have any selling items yet")
            }
        }
    }
}

struct SellingList_Previews: PreviewProvider {
    static var previews: some View {
        SellingList()
    }
}
