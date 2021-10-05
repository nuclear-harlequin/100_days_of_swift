//
//  ViewController.swift
//  Project 2
//
//  Created by Giovanna Toni on 25/08/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAnswered = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia" , "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) / Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
                
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            questionsAnswered += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())!"
            score -= 1
            questionsAnswered += 1
        }
        
        if questionsAnswered < 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score)\nQuestion \(questionsAnswered) out of 10", preferredStyle: .alert)
            // an alert-type message pops up on the screen for the user, showing their new score
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            // adds a button to the alert that shows "continue"
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Game Over!\nYour final score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
            score = 0
            present(ac, animated: true)
        }
        
    }
    
    @objc func showScore(){
        let scoreBoard = "Your score is: \(score)!"

        let vc = UIActivityViewController(activityItems: [scoreBoard], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
