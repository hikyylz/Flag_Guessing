//
//  ViewController.swift
//  project02
//
//  Created by Kaan Yıldız on 11.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        
        countries += ["estonia" , "france" , "germany" , "ireland" , "italy" , "monaco" , "nigeria" , "poland" , "russia" , "spain" , "uk" , "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }

    // parametre yerinde nil default tanımlaması olması önemli.
    func askQuestion(action : UIAlertAction! = nil) {
        // this feature shuffle items at countries array.
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0] ) , for: .normal )
        button2.setImage(UIImage(named: countries[1] ) , for: .normal )
        button3.setImage(UIImage(named: countries[2] ) , for: .normal )
        
        title = countries[correctAnswer].uppercased()
    
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title :String
        
        // buradaki tag sayısını sen belirleyebiliyordun.
        //tıpkı Int.random yerindeki 0...2 yi senin belirlediğin gibi.
        if sender.tag == correctAnswer {
            title = "Correct !"
            score += 1          // operatörün sağ solunda boşluk koy, gıcık !
        }else{
            title = "Wrong !"
            score -= 1
        }
        
        
        let ac = UIAlertController(title: title, message: "your score is \(score)", preferredStyle: .alert)
        
        // buradaki askQuestion benim yazdığım func değil dikkat et!
        ac.addAction(UIAlertAction(title: title, style: .default , handler: askQuestion ))
        present(ac , animated: true)
        
        
    }
    
}

