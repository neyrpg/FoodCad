//
//  Refeicao.swift
//  FoodCad
//
//  Created by Ney on 11/3/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import Foundation

class Refeicao : NSObject, NSCoding{
   
    
    
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

    func detalhes() -> String {
        var msg = "Itens: "
        
        for item in itens {
            msg += "\n \(item.nome) = \(item.calorias.description)"
        }
        return msg
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey : "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array        
    }
}
