//
//  ViewController.swift
//  multiples
//
//  Created by Vikas Cheruku on 1/12/16.
//  Copyright © 2016 vikcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    
    var startingSum:Int = 0
    var rollingSum:Int = 0
    var addingFactor:Int = 0
    var beforeRollingSum:Int = 0
    let maxSum:Int = 50
    
    //Outlets
    
    @IBOutlet weak var playBtn:UIButton!
    @IBOutlet weak var addBtn:UIButton!
    @IBOutlet weak var textBox:UITextField!
    @IBOutlet weak var addLabel:UILabel!
    @IBOutlet weak var header:UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    
    @IBAction func playButtonPressed (sender: UIButton) {
        if (textBox.text != nil && textBox.text != "") {
            addingFactor = Int(textBox.text!)!
            startGame()
        }
    }
    
    func startGame() {
        playBtn.hidden = true
        header.hidden = true
        textBox.hidden = true
        
        addBtn.hidden = false
        addLabel.hidden = false
    }
    
    func restartGame() {
        playBtn.hidden = false
        header.hidden = false
        textBox.hidden = false
        
        addBtn.hidden = true
        addLabel.text = "Start"
        addLabel.hidden = true
        startingSum = 0
        rollingSum = 0
        addingFactor = 0
    }
    
    @IBAction func addButtonPressed (sender: UIButton) {
        beforeRollingSum = rollingSum
        rollingSum = beforeRollingSum + addingFactor
        
        if (rollingSum >= maxSum) {
            restartGame()
        } else {
            addLabel.text = "\(beforeRollingSum) + \(addingFactor) = \(rollingSum)"
        }
    }


}

