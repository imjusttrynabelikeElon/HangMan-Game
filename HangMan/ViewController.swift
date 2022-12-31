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

var startWords = [String]()

var promptWord = String()

var randomWord = ""

var hidden = [String]()


let tf = UITextField()

let progressLabel = UILabel()

let usedLabel = UILabel()

let newGameButton = UIButton()

let go = UILabel()

let go2 = UILabel()

override func viewDidLoad() {

super.viewDidLoad()

title = "GUESS KARON"



if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
if let startWords = try? String(contentsOf: startWordsURL) {
 allWords = startWords.components(separatedBy: "\n")
let wordssss = startWords.randomElement()

randomWord =  allWords.randomElement()!



}


} else {
allWords = ["HIIII", "GGGGYU"]
}





tf.textAlignment = .center
tf.borderStyle = .roundedRect

tf.textAlignment = .center
tf.font = .systemFont(ofSize: 28, weight: .semibold)

tf.delegate = self

progressLabel.textAlignment = .center
progressLabel.font = .monospacedSystemFont(ofSize: 29.0, weight: .light)
progressLabel.backgroundColor = .yellow


go.font = .monospacedSystemFont(ofSize: 24, weight: .medium)
go.textColor = .black
go.text = "Guess a letter"


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

[tf, progressLabel, go, usedLabel, go2, newGameButton].forEach { v in
v.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(v)

}
let g = view.safeAreaLayoutGuide
NSLayoutConstraint.activate([

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

func newGame() {


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











func submit(_ answer: String) {

if usedLetters.contains(answer) {
return
}
usedLetters.append(answer)
usedLabel.text = usedLetters.joined()

let wordArray = randomWord.map(String.init)

for index in hidden.indices {
if wordArray[index] == answer {
hidden[index] = wordArray[index]
}
}

progressLabel.text = hidden.joined()

if hidden == wordArray {
progressLabel.textColor = .red

// clear and disable text field
tf.text = ""
tf.isUserInteractionEnabled = false

// dismiss keyboard
view.endEditing(true)

// show the new game button
newGameButton.isHidden = false





}


}










@objc func newGameTapped(_ sender: UIButton) {
newGame()
}







}





