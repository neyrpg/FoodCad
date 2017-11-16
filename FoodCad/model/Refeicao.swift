//
//  Refeicao.swift
//  FoodCad
//
//  Created by Ney on 11/3/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import Foundation

class Refeicao {
    
    let nome:String
    let felicidade:Int
    var itens = Array<Item>()
    
    init(nome:String, felicidade:Int, itens: Array<Item> = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    init(nome:String, felicidade:Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    func todasCalorias() -> Double {
      var total = 0.0
        
        for item in itens {
         total += item.calorias
        }
        return total
    }

    
    
}
