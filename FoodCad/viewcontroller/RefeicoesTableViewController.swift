//
//  RefeicoesTableViewController.swift
//  FoodCad
//
//  Created by Ney on 11/7/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import UIKit

class RefeicaoTableViewController : UITableViewController{
    
    var refeicoes = [Refeicao(nome: "Arroz", felicidade: 5),
                    Refeicao(nome: "Feijao", felicidade: 4),
                    Refeicao(nome: "Macarrao", felicidade: 3)       ]
    
    //forma tradiconal informando o tipo do parametro add(refeicao: refeicao)
    func add2(refeicao: Refeicao) {
        print("Adicionando \(refeicao.nome)")
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    //dessa forma e preciso apenas passar o objeto add(refeicao)
    func add(_ refeicao: Refeicao) {
        print("Adicionando \(refeicao.nome)")
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "adicionarComida){
            let view = segue.destination as? ViewController
            view?.refeicaoController = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let valor = refeicoes[indexPath.row]
        let celula = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        celula.textLabel?.text = valor.nome+" - \(valor.felicidade)"
        
        
        
        return celula
    }}
