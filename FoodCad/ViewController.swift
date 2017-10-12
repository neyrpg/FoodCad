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
    var txtNome: UITextField!
    
    @IBOutlet
    var txtSatisfacao: UITextField!
    
    @IBAction
    func addFood(){
        let comida = txtNome.text
        let satisfacao = txtSatisfacao.text
        print("Comida  boa!!!!\(comida) satisfacao \(satisfacao)");
        
    }
    

}

