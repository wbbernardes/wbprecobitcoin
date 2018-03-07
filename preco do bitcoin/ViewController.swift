//
//  ViewController.swift
//  preco do bitcoin
//
//  Created by Wesley Brito on 06/03/2018.
//  Copyright © 2018 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://blockchain.info/pt/ticker") {
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                if erro == nil{
                    
                    if let dadosRetorno = dados{
                        
                        do{
                            if let objetoJson = try JSONSerialization.jsonObject(with: dadosRetorno, options: []) as? [String: Any] {
                                
                                if let brl = objetoJson["BRL"] as? [String: Any] {
                                    
                                    
                                    if let preco = brl["buy"] as? Double {
                                        
                                        print(preco)
                                    }
                                }
                            }
                        }catch{
                            print("Erro ao formatar retorno.")
                        }
                    }
                }else{
                    print("Erro ao fazer a consulta de preço!")
                }
            }
            tarefa.resume()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

