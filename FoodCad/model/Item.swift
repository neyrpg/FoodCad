//
//  Item.swift
//  FoodCad
//
//  Created by Ney on 11/3/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import Foundation

class Item: Equatable {
   
    
    let nome:String
    let calorias:Double
    
    init(nome:String, calorias:Double) {
        self.nome = nome
        self.calorias = calorias
    }
 

    
}
func ==(item1: Item, item: Item) -> Bool {
    return (item1.nome == item.nome && item1.calorias == item.calorias)
}
