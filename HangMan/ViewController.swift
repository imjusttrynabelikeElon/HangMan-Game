//
//  ViewController.swift
//  HangMan
//
//  Created by Karon Bell on 12/17/22.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITextFieldDelegate {

var allWords = [String]()

var usedLetters = [String]()

var wrongAnswer = [String]()

var startWords = [String]()

var promptWord = String()

var randomWord = ""

var wordArray3 = [String]()

var hidden = [String]()

var rightAnswers = [String]()

var wordArray2 =  [String]()

let tf = UITextField()

let progressLabel = UILabel()

let usedLabel = UILabel()

@IBOutlet var hangManImage: UIImageView!

let newGameButton = UIButton()

let go = UILabel()

let go2 = UILabel()

let enterLeter = UILabel()
override func viewDidLoad() {


super.viewDidLoad()

title = "HangMan Game Created by Karon."

navigationController?.isNavigationBarHidden = false


overrideUserInterfaceStyle = .light






if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
if let startWords = try? String(contentsOf: startWordsURL) {
allWords = startWords.components(separatedBy: "\n")
let wordssss = startWords.randomElement()

randomWord =  allWords.randomElement()!



}


} else {
allWords = ["HIIII", "GGGGYU"]
}

enterLeter.font = .monospacedSystemFont(ofSize: 24, weight: .medium)
enterLeter.textColor = .black
enterLeter.text = "Enter a letter"



tf.textAlignment = .center
tf.borderStyle = .roundedRect
tf.layer.borderWidth = 3

tf.textAlignment = .center
tf.font = .systemFont(ofSize: 28, weight: .semibold)

tf.delegate = self

progressLabel.textAlignment = .center
progressLabel.font = .monospacedSystemFont(ofSize: 29.0, weight: .light)
progressLabel.backgroundColor = .yellow


go.font = .monospacedSystemFont(ofSize: 24, weight: .medium)
go.textColor = .black
go.text = "Hidden letter"


usedLabel.textAlignment = .center
usedLabel.font = .monospacedSystemFont(ofSize: 29.0, weight: .light)
usedLabel.backgroundColor = .cyan


go2.font = .monospacedSystemFont(ofSize: 24, weight: .medium)
go2.textColor = .black
go2.text = "All Letters"
go2.textAlignment = .center


newGameButton.setTitle("New Game", for: [])
newGameButton.setTitleColor(.white, for: .normal)
newGameButton.setTitleColor(.lightGray, for: .highlighted)
newGameButton.backgroundColor = .systemBlue
newGameButton.layer.cornerRadius = 9
newGameButton.layer.borderColor = UIColor.blue.cgColor
newGameButton.layer.borderWidth = 3

[ enterLeter, tf, progressLabel, go, usedLabel, go2, newGameButton].forEach { v in
v.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(v)

}
let g = view.safeAreaLayoutGuide
NSLayoutConstraint.activate([


enterLeter.widthAnchor.constraint(equalToConstant: 230.0),
enterLeter.topAnchor.constraint(equalTo: g.topAnchor, constant: 20.0),
enterLeter.centerXAnchor.constraint(equalTo: g.centerXAnchor),

tf.widthAnchor.constraint(equalToConstant: 80.0),
tf.topAnchor.constraint(equalTo: g.topAnchor, constant: 80.0),
tf.centerXAnchor.constraint(equalTo: g.centerXAnchor),

progressLabel.widthAnchor.constraint(equalToConstant: 300.0),
progressLabel.topAnchor.constraint(equalTo: tf.bottomAnchor, constant: 40.0),
progressLabel.centerXAnchor.constraint(equalTo: g.centerXAnchor),



go.widthAnchor.constraint(equalToConstant: 210.0),
go.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 85.0),
go.centerXAnchor.constraint(equalTo: g.centerXAnchor),



usedLabel.widthAnchor.constraint(equalToConstant: 305.0),
usedLabel.topAnchor.constraint(equalTo: go.bottomAnchor, constant: 39.0),
usedLabel.centerXAnchor.constraint(equalTo: g.centerXAnchor),

go2.widthAnchor.constraint(equalToConstant: 203.0),
go2.topAnchor.constraint(equalTo: usedLabel.bottomAnchor, constant: 93.0),
go2.centerXAnchor.constraint(equalTo: g.centerXAnchor),

newGameButton.widthAnchor.constraint(equalToConstant: 200.0),
newGameButton.topAnchor.constraint(equalTo: go2.bottomAnchor, constant: 40.0),
newGameButton.centerXAnchor.constraint(equalTo: g.centerXAnchor),

])

newGameButton.addTarget(self, action: #selector(newGameTapped(_:)), for: .touchUpInside)

newGame()

}


func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

// upper-case the entered letter
let s = string.uppercased()

// we don't want to process if a string was pasted into the field
if s.count != 1 {
return false
}

// only allow A - Z
if s.rangeOfCharacter(from: .uppercaseLetters) == nil {
return false
}

// replace the current text
textField.text = s

// process the entered letter
submit(s)

// don't let the textfield process the string
return false
}











func submit(_ answer: String) {

let ac = UIAlertController(title: "Sorry too many attempts", message: "New Game", preferredStyle: .alert)

let restart = UIAlertAction(title: "Restart", style: .cancel)



if usedLetters.contains(answer) {
return
}

usedLetters.append(answer)
usedLabel.text = usedLetters.joined()

wordArray3 = randomWord.map(String.init)

for index in hidden.indices {

title = "Hint.. \(String(describing: wordArray3.first!)) is the first letter... \(String(describing: wordArray3.last!)) is the last!"

hangManImage.image = UIImage(named: "")
if wordArray3[index] == answer {
hidden[index] = wordArray3[index]
rightAnswers.append(answer)

}

print("Here is the wordArray3 \(wordArray3)")



}










if usedLetters != rightAnswers && !rightAnswers.contains(answer) {
wrongAnswer.append(answer)
print("wrong answers = \(wrongAnswer)")
// remove the first letter from usedLetters
}



if wrongAnswer.count == 1 {
hangManImage.image = UIImage(named: "hangman-1")
}

if wrongAnswer.count == 2 {
hangManImage.image =  UIImage(named: "hangman-2")
}

if wrongAnswer.count == 3 {
hangManImage.image =  UIImage(named: "hangman-3")
}


if wrongAnswer.count == 4 {
hangManImage.image =  UIImage(named: "hangman-3")
}

if wrongAnswer.count == 5 {
hangManImage.image =  UIImage(named: "hangman-3")
}

if wrongAnswer.count == 6 {
hangManImage.image =  UIImage(named: "hangman-3")
}

if wrongAnswer.count == 7 {
hangManImage.image =  UIImage(named: "hangman-3")
}

if wrongAnswer.count == 8 {
hangManImage.image =  UIImage(named: "hangman-3")
}

if wrongAnswer.count == 9 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 10 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 11 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 12 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 13 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 14 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 15 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 16 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 17 {
hangManImage.image =  UIImage(named: "hangman-3")
}
if wrongAnswer.count == 18 {
hangManImage.image =  UIImage(named: "hangman-3")
}

if usedLetters.count == 19 {
//hangManImage.image =  UIImage(named: "lose")
}

if usedLetters.count == 19 {



print(usedLetters.count)
hangManImage.image = UIImage(named: "lose")
ac.addAction(restart)
present(ac, animated: true)
rightAnswers.removeAll()
wrongAnswer.removeAll()
usedLetters.removeAll()
tf.text = ""


newGame()

title = "Guess a letter to get a hint..."
hangManImage.image = UIImage(named: "lose")

}







if usedLetters.count == 19 {
// hangManImage.image = UIImage(named: "lose")
//newGame()

}



if rightAnswers.count == 8 {
title = "NEW GAME YESS!!!"

print("SCORE = 1")
newGame()

}


// this is what made the wrong answers array work correctly/

progressLabel.text = hidden.joined()

if hidden == wordArray2 {
progressLabel.textColor = .red

// clear and disable text field
tf.text = ""
tf.isUserInteractionEnabled = false

// dismiss keyboard
view.endEditing(true)

// show the new game button
//newGameButton.isHidden = false





}


}



func newGame() {







allWords.shuffle()

wrongAnswer.removeAll()
usedLetters.removeAll()

hangManImage.image = UIImage(named: "")



// cycle the array of game words
allWords.append(allWords.removeFirst())

// safely unwrap
guard let w = allWords.first else {
fatalError("Bad setup")
}

// upper-case the word
randomWord = w.uppercased()

// set hidden string to "####..."
hidden = Array(repeating: "?", count: randomWord.count)

// clear used letters
usedLetters = []

// update the game progress label
progressLabel.text = String(hidden.joined())
progressLabel.textColor = .black

// update used letters label
usedLabel.text = " "

// hide the new game button
newGameButton.isHidden = true

// re-enable text field
tf.isUserInteractionEnabled = true

// for development
print("New Game Word is:", randomWord)

}










@objc func newGameTapped(_ sender: UIButton) {

newGame()
}







}






