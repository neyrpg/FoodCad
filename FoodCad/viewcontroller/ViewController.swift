//
//  ViewController.swift
//  FoodCad
//
//  Created by Ney on 10/12/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet
    var txtNome: UITextField?
    
    @IBOutlet
    var txtSatisfacao: UITextField?
    
    @IBAction
    func addFood(){
        if(txtNome == nil || txtSatisfacao == nil){
            return
        }
        
        let nome:String = txtNome!.text!
        if let felicidade:Int = Int(txtSatisfacao!.text!) {
            
            let refeicao = Refeicao(nome: nome, felicidade: felicidade)
            
            print("Comida  boa!!!!\(refeicao.nome) satisfacao \(refeicao.felicidade)");
        }
       
      
    }
    

}

