//
//  RefeicoesTableViewController.swift
//  FoodCad
//
//  Created by Ney on 11/7/17.
//  Copyright © 2017 Giltecnologia. All rights reserved.
//

import UIKit

class RefeicaoTableViewController : UITableViewController, addRefeicaoProtocol{
    
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
        
        
        let diretorios = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentosDir = diretorios[0]
        let arquivoRefeicoes = "\(documentosDir)/refeicoes.data"
        NSKeyedArchiver.archiveRootObject(refeicoes, toFile: arquivoRefeicoes)
        print(arquivoRefeicoes)//TODO Refatorar
        
    }
    
    override func viewDidLoad() {
        let diretorios = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentosDir = diretorios[0]
        let arquivoRefeicoes = "\(documentosDir)/refeicoes.data"
        if let load = NSKeyedUnarchiver.unarchiveObject(withFile: arquivoRefeicoes){
            self.refeicoes = load as! Array<Refeicao>//TODO Refatorar
            
        }
        
        print(arquivoRefeicoes)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "adicionarComida"){
            let view = segue.destination as? ViewController
            view?.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let valor = refeicoes[indexPath.row]
        let celula = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        celula.textLabel?.text = valor.nome+" - \(valor.felicidade)"
        let longReconizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetalheLinha))
        celula.addGestureRecognizer(longReconizer)
        return celula
    }
    
    @objc func showDetalheLinha(recognizer : UILongPressGestureRecognizer){
        if(recognizer.state == UIGestureRecognizerState.began){
            
            print("show item inicio")
            //cast
            let celula = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: celula) {
                let linha = indexPath.row
                let refeicao = refeicoes[linha]
                print("Refeicao é: \(refeicao.nome)")
                
               
                
                RemoveRefeicaoController(controller: self).show(refeicao: refeicao, handler: { action in
                    //Closure é implementar diretamente o handler
                    print("Removendo \(refeicao.nome)")
                    self.refeicoes.remove(at: linha)
                    self.tableView.reloadData()
                })
            }
            
            
        }
    }
    
    
}
