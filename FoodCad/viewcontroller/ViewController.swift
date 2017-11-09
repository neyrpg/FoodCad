//
//  ViewController.swift
//  FoodCad
//
//  Created by Ney on 10/12/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if(cell.accessoryType == UITableViewCellAccessoryType.none) {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
                
            }
            
            
        }
    }
    
    var itens = [Item(nome: "arroz", calorias: 10),
                 Item(nome: "feijão", calorias: 110),
                 Item(nome: "macarrão", calorias: 250.5),
                 Item(nome: "tomate", calorias: 100.7),
                 ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = itens[indexPath.row].nome
        return cell
    }
    

    @IBOutlet
    var txtNome: UITextField?
    
    @IBOutlet
    var txtSatisfacao: UITextField?
    
    var delegate : addRefeicaoProtocol?
    
    @IBAction
    func addFood(){
        if(txtNome == nil || txtSatisfacao == nil){
            return
        }
        
        let nome:String = txtNome!.text!
        if let felicidade:Int = Int(txtSatisfacao!.text!) {
            
            let refeicao = Refeicao(nome: nome, felicidade: felicidade)
            
            print("Comida  boa!!!!\(refeicao.nome) satisfacao \(refeicao.felicidade)");
            
            if (delegate == nil) {
                return
            }
             delegate?.add(refeicao)
            
            if let nav = navigationController {
                nav.popViewController(animated: true)
            }
        }
       
      
    }
    

}

