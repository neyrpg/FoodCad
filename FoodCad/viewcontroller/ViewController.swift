//
//  ViewController.swift
//  FoodCad
//
//  Created by Ney on 10/12/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addItemProtocol {
  
    @IBOutlet var tableView : UITableView?
    
    
    var itensSelecionados = Array<Item>()
    var itens = [Item(nome: "arroz", calorias: 10),
                 Item(nome: "feijão", calorias: 110),
                 Item(nome: "macarrão", calorias: 250.5),
                 Item(nome: "tomate", calorias: 100.7),
                 ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
             let item = itens[indexPath.row]
            if(cell.accessoryType == UITableViewCellAccessoryType.none) {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
        
                itensSelecionados.append(item)
                
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
                if let index = itensSelecionados.index(of: item) {
                    itensSelecionados.remove(at: index)
                    
                }
            }
            
            
        } else {
            Alerta(self).show(mensagem: "Erro ao rendereizar tabela")
        }
    }
    
    
    
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
        
       
        if let refeicao: Refeicao = getRefeicaoFormulario(){
            if let refeicoes = delegate {
                refeicoes.add(refeicao)
                print("Comida  boa!!!!\(refeicao.nome) satisfacao \(refeicao.felicidade) com os itens \(refeicao.itens)");
                
                
                
                
            }
        }
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            Alerta(self).show(mensagem: "Não foi possível retornar a tela anterior, mas a refeição foi adicionada")
        }
        
    }
   
    func getRefeicaoFormulario() -> Refeicao? {
       
        if(txtNome == nil || txtSatisfacao == nil){
            return nil
        }
        
        let nome:String = txtNome!.text!
        if let felicidade:Int = Int(txtSatisfacao!.text!) {
            
            let refeicao = Refeicao(nome: nome, felicidade: felicidade, itens : itensSelecionados )
            
            return refeicao
        }
        return nil
    }
    
    override func viewDidLoad() {
        let barButton = UIBarButtonItem(title: "Novo Item", style: UIBarButtonItemStyle.plain,
                                        target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = barButton
        
        let diretorios = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentosDir = diretorios[0]
        let arquivoItens = "\(documentosDir)/itens.data"
        if let load = NSKeyedUnarchiver.unarchiveObject(withFile: arquivoItens){
            self.itens = load as! Array<Item>
        }//TODO Refatorar
        
        print(arquivoItens)
        
    }

    @objc func showNewItem(){
        print("chamou!")
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alerta(self).show()
            
        }
    }
    
    func addItem(_ item: Item) {
        itens.append(item)
        
        let diretorios = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentosDir = diretorios[0]
        let arquivoItens = "\(documentosDir)/itens.data"
        NSKeyedArchiver.archiveRootObject(itens, toFile: arquivoItens)
        print(arquivoItens)//TODO Refatorar
        
        if let table = tableView {
            table.reloadData()
        } else {
            Alerta(self).show("Alerta",mensagem: "Não foi possível atualizar a table")
        }
        //Alerta(self).show(mensagem: "Item Incluído")
    }
}

