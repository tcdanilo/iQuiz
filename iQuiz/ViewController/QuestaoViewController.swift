//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Danilo Costa tiago on 04/04/23.
//

import UIKit

class QuestaoViewController: UIViewController {

    
    var pontuacao = 0
    var numeroQuestao = 0
    
    @IBOutlet var botoesRespostas: [UIButton]!
    
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertouResposta = questoes[numeroQuestao].respostaCorreta == sender.tag
        
        if usuarioAcertouResposta {
            pontuacao += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
            
        }else{
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue:17/255 , alpha: 1.0)
            
        }
        
        if numeroQuestao < questoes.count - 1{
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
            
            
        } else {
            navegaParaTelaDesemepenho()
        }
        
        
        
    }
    
    @IBOutlet weak var TituloQuestaoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
        configurarQuestao()
      
    }
    
    func configurarLayout(){
        navigationItem.hidesBackButton = true
        TituloQuestaoLabel.numberOfLines = 0
        TituloQuestaoLabel.textAlignment = .center
        for botao in botoesRespostas{
            botao.layer.cornerRadius = 12.0
        }
    }
    @objc func configurarQuestao(){
        TituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        for botao in botoesRespostas{
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
            
        }
    }
    
    func navegaParaTelaDesemepenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else {return}
        desempenhoVC.pontuacao = pontuacao
    }
    
    

}
