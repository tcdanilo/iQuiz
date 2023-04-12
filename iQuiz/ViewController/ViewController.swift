//
//  ViewController.swift
//  iQuiz
//
//  Created by Danilo Costa tiago on 29/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
        
    }
    
    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    
    @IBAction func botaoPressionado(_ sender: Any) {
        
    }
    func configuraLayout(){
        botaoIniciarQuiz.layer.cornerRadius = 12.0
        navigationItem.hidesBackButton = true
    }

}

