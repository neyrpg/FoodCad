//
//  RemoveRefeicaoController.swift
//  FoodCad
//
//  Created by Ney on 28/11/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import Foundation
import UIKit


class RemoveRefeicaoController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void	){
        //criação de dialog
        let dialog = UIAlertController(title: "Felicidade", message: "A sua refeição é \(refeicao.nome). \(refeicao.detalhes()) ", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.destructive, handler: handler)
        dialog.addAction(ok)
        dialog.addAction(remove)
        controller.present(dialog, animated: true, completion: nil)    }
    
    
}
