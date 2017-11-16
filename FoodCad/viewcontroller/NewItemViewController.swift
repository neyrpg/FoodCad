//
//  NewItemViewController.swift
//  FoodCad
//
//  Created by Ney on 14/11/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var caloriasField : UITextField!
    
    var delegate: addItemProtocol?
    
    init(delegate: addItemProtocol) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
   
    
    @IBAction func addNewItem(){
       
        
        let nome = nameField!.text
        let calorias = Double(caloriasField!.text!)
        
        if(nome == nil && calorias == nil && delegate == nil){
            return
        }
        
        
        let item = Item(nome: nome!, calorias: calorias!)
        delegate!.addItem(item)
        
         print("add new item \(item.nome) com \(item.calorias)")
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
        
        
    }
    
  

}
