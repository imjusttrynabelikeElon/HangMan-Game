//
//  ViewController.swift
//  HangMan
//
//  Created by Karon Bell on 12/17/22.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    var allWords = [String]()
 
    var usedLetters = [String]()
  
    var startWords = [String]()
    
    var promptWord = String()
    
    var randomWord = ""
  
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        
        EnterGuess()
        fileWork()
        print(randomWord)
        
        title = "GUESS A Letter: ?????????)"
        
    }
    
    
    
    
    
    
    
    
    
    func fileWork() {
        
        
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
                let wordssss = startWords.randomElement()
                
                randomWord =  allWords.randomElement()!
                
                
                
            }
            
            
        }
        
        
    }
    
    
  
    func EnterGuess() {
        
        let ac = UIAlertController(title: "Guess a letter", message: nil, preferredStyle: .alert)
        ac.addTextField()
      
      

      var submitGuess = UIAlertAction(title: "Submit", style: .default) {_ in
        
        
            guard var answer = ac.textFields?[0].text else {return }
      answer
            
         
            
            self.submit(answer)
            self.EnterGuess()
    
            
        }
        ac.addAction(submitGuess)
        present(ac, animated: true)
        
       
    }
    
    

    func submit(_ answer: String) {
        
    let guessedLetter = answer
        
        let wordArray = randomWord.map(String.init)
        var hidden = Array(repeating: "x", count: randomWord.count)
        
    var leterrr = ["?","?","?","?","?","?","?","?",]
     
       var uh = 0
        
        title = promptWord
      
        print(promptWord)
       
        
  
       
    
        for  index in leterrr.indices {
            
          
            
         
            
            // i just realized its most likey not the arrays or code thats the problem. I pretty much  tried all solutions and they did not work. Its the loop itself/ index or button.
        
     
      
     
        if wordArray[0] == answer {
         
        hidden[0] = answer
     
     
        
       hidden = [wordArray[0],"?","?","?","?","?","?","?",]
        
        } else  if wordArray[1] == answer {
       hidden[1] = answer
       hidden = [wordArray[0],wordArray[1],"?","?","?","?","?","?",]
     
       } else  if wordArray[2] == answer {
       hidden[2] = answer
       hidden = [wordArray[0],wordArray[1],wordArray[2],"?","?","?","?","?",]
     
       } else  if wordArray[3] == answer {
       hidden[3] = answer
       hidden = [wordArray[0],wordArray[1],wordArray[2],wordArray[3],"?","?","?","?",]
     
       } else  if wordArray[4] == answer {
       hidden[4] = answer
       hidden = [wordArray[0],wordArray[1],wordArray[2],
                 wordArray[3],wordArray[4],"?","?","?","?"]
     
       } else  if wordArray[5] == answer {
       hidden[5] = answer
       hidden = [wordArray[0],wordArray[1],wordArray[2],wordArray[3],wordArray[4],wordArray[5],"?","?"]
     
       } else  if wordArray[6] == answer {
       hidden[6] = answer
       hidden = [wordArray[0],wordArray[1],wordArray[2],wordArray[3],wordArray[4],wordArray[5],wordArray[6], "?"]
     
       } else  if wordArray[7] == answer {
       hidden[7] = answer
       hidden = [wordArray[0],wordArray[1],wordArray[2],wordArray[3],wordArray[4],wordArray[5],wordArray[6],wordArray[7]]
     
       }
       
             
      
           
         
        
       
        
     
          
            
            
        }
        print(hidden.joined())
     
     //   print(wordArray)
      
        
        title = randomWord
        
        
        
        
        
    }
     

            

        }
        
        
        
        
        
        
    
    
    
    

