//
//  main.swift
//  Assign1
//
//  Created by Lauren Kapraun on 1/20/20.
//  Copyright © 2020 Lauren Kapraun. All rights reserved.
//

/* QUESTION 4 */
var numberOfBabies: Int

print ("Enter number of babies: ", terminator: "")

if let numberOfBabies = readLine() {
    if let numberOfBabies = Int(numberOfBabies){
        switch numberOfBabies{
        case 1:
            print("Congratulations.")
        case 2:
            print("Wow. Twins.")
        case 3:
            print("Wow. Triplets.")
        case 4:
            print("Unbelieveable; ")
            print("\(numberOfBabies) babies.")
        case 5:
            print("Unbelieveable; ")
            print("\(numberOfBabies) babies.")
        default:
            print("I don't believe you.")
        }
    }
}


/* QUESTION 3
var score: Int
var grade: Character

print ("Enter your score: ", terminator: "")

if let score = readLine() {
    if let score = Int(score){
        if (score >= 90){
           grade = "A";
            print("Score = \(score)")
            print("Grade = \(grade)")
        }
        else if (score >= 80){
           grade = "B";
            print("Score = \(score)")
            print("Grade = \(grade)")
        }
        else if (score >= 70){
           grade = "C";
            print("Score = \(score)")
            print("Grade = \(grade)")
        }
        else if (score >= 60){
           grade = "D";
            print("Score = \(score)")
            print("Grade = \(grade)")
        }
        else {
           grade = "F";
            print("Score = \(score)")
            print("Grade = \(grade)")
        }
    }
}
*/

/* QUESTION 2
 var sentence = "Text processing is hard!"
 var mySubstring = sentence.prefix(19)

 var position = mySubstring.count

 print(sentence)
 print("012345678901234567890123")

 print("The word \"hard\" starts at index \(position)")

 mySubstring += "easy!"

 print("The changed string is: ")
 print(mySubstring.uppercased())
 */


/* QUESTION 1
 var amount, originalAmount, calcAmount, quarters, dimes, nickels, pennies: Int

print ("Enter a whole number from 1 to 99.")
print ("I will find a combination of coins")
print ("that equals that amount of change. ", terminator: "")

// read user input
if let amount = readLine() {
    if let originalAmount = Int(amount){
        if (originalAmount >= 1){
            if (originalAmount <= 99){
                calcAmount = originalAmount
                
                quarters = calcAmount/25
                calcAmount = calcAmount%25
                
                dimes = calcAmount / 10;
                calcAmount = calcAmount % 10;
                
                nickels = calcAmount / 5;
                calcAmount = calcAmount % 5;
                
                pennies = calcAmount;
                
                print ("\(originalAmount) cents in coins can be given as:")
                print ("\(quarters) quarters")
                print ("\(dimes) dimes")
                print ("\(nickels) nickels")
                print ("\(pennies) pennies")
                
            }else{
                print ("NUMBER OUT OF BOUNDS");
            }
        }else{
            print ("NUMBER OUT OF BOUNDS");
        }
    }else{
        print ("NUMBER OUT OF BOUNDS");
    }
}
 */

