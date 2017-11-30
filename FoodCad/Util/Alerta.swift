//
//  Alerta.swift
//  FoodCad
//
//  Created by Ney on 28/11/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import Foundation
import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(_ controller: UIViewController){
        self.controller = controller
    }
    
    func show(_ title:String = "Erro", mensagem: String = "Erro não esperado"){
        let alerta = UIAlertController(title: title, message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
        
    }
}
