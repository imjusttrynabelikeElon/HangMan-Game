//
//  ViewController.swift
//  HangMan
//
//  Created by Karon Bell on 12/17/22.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    var allWords = [String]()
    // var LetterInWordsa = String(allWords)
    var usedLetters = [String]()
    let word = ""
    //var words = [""]
    var thePuzzleLetter = ""
    var comeOn = ""
    var wrongAnswers = 0
    var startWords = [String]()
    var promptWord = String()
    var randomWord = String()
    var strLetter = String()
    var newTitle = ""
    var ghgh = [String]()
    var answer = [String]()
    var strLetterr = String()
 
    
    // var wordssss = "".randomElement()
    
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        EnterGuess()
        submit(promptWord)
        fileWork()
        print(answer)
         print(randomWord)
        
        title = "GoodLuck Pal:) \(comeOn)"
        
    }
    
    
    
    
    // the amount
    
    
    
    
    
    
    
    func fileWork() {
        
        
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
                let wordssss = startWords.randomElement()
                
                randomWord =  allWords.randomElement()!
                
              //  promptWord = String(repeating: "?", count: randomWord.count)
                //  var replace = promptWord.replacingOccurrences(of: randomWord , with: answer, options: .regularExpression, range: nil)
                for letter in randomWord {
                    strLetterr = String(letter)
                    if answer.contains(strLetter) {
                        //  promptWord = answer.replacingOccurrences(of: answer, with: randomWord)
                        //   print(replace)
                        
                    //    print(answer)
                        // promptWord += strLetter
                        // print("U^e")
                        //   print("Thi")
                        
                    } else {
                        // promptWord = promptWord.replacingOccurrences(of: answer, with: randomWord)
                      //  print(strLetterr)
                        //et   print("hh")
                        //   promptWord += "?"
                        
                        // print(thi)
                        
                    }
                   // print(promptWord)
               //     promptWord = promptWord.replacingOccurrences(of: answer, with: randomWord)
                    
                    
                    //     let thePuzzleLetter = startWords.replacingOccurrences(of: startWords, with: "????????")
                    
                    //   let strLetter = String(thePuzzleLetter)
                    
                    //   print(wordssss!)
                    
                    
                    
                    
                    
                    // the amount the of time
                    //  print(strLetter.count)
                    
                    
                    
                    //  title = thePuzzleLetter
                    // print(thePuzzleLetter.count)
                    
                    //   print(startWords)
                    
                    //   func isLetterInWord(word: Character) {
                    
                    //   }
                    
                    
                    
                    // the amount of time it takes to be in the amount of time
                    
                    // the amount of time this takes to let you know
                    
                    
                    
                    // this is the amount of time to
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                // title = randomWord
                
                //     let thePuzzleLetter = startWords.replacingOccurrences(of: startWords, with: "????????")
                
                //   let strLetter = String(thePuzzleLetter)
                
                //   print(wordssss!)
                
                
                
                
                
                // the amount the of time
                //  print(strLetter.count)
                
                
                
                //  title = thePuzzleLetter
                // print(thePuzzleLetter.count)
                
                //   print(startWords)
                
                //   func isLetterInWord(word: Character) {
                
                //   }
                
                
                
                // the amount of time it takes to be in the amount of time
                
                // the amount of time this takes to let you know
                
                
                
                // this is the amount of time to
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
        }
        
        
        
        if allWords.isEmpty {
            allWords = ["HGHCG"]
            
        }
    }
    
    
    func EnterGuess() {
     
        let ac = UIAlertController(title: "Guess a letter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitGuess = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else {return }
            self?.submit(answer)
        }
        ac.addAction(submitGuess)
        present(ac, animated: true)
        
       // title = comeOn
    }
    
    
    
    func submit(_ answer: String) {
        
        var lowerWord = randomWord
    
      
        for letter in lowerWord {
          
           EnterGuess()
            
            if answer.contains(letter) == true {
             
                comeOn += String(letter)
            
              
                
            } else  {
              
                comeOn += "?"
                
                
                
               
            }
            
          
         
            
        }
        
      
        print(comeOn)
      
        
        
    }
    
 
}
