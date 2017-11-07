//
//  RefeicoesTableViewController.swift
//  FoodCad
//
//  Created by Ney on 11/7/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import UIKit

class RefeicaoTableViewController : UITableViewController{
    
    let refeicoes = [Refeicao(nome: "Arroz", felicidade: 5),
                    Refeicao(nome: "Feijao", felicidade: 4),
                    Refeicao(nome: "Macarrao", felicidade: 3)       ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let valor = refeicoes[indexPath.row]
        let celula = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        celula.textLabel?.text = valor.nome+" - \(valor.felicidade)"
        
        
        
        return celula
    }}
