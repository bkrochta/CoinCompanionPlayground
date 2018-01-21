//: Playground - noun: a place where people can play

import UIKit
//import PlaygroundSupport
//
//PlaygroundPage.current.needsIndefiniteExecution = true
//gets page source
let test = "bitcoin"


func getInfo() -> String { //method returns string of page source
    let myURLString = "https://coinmarketcap.com" //input url
    guard let myURL = URL(string: myURLString) else { //checks if url is valid; if valid continue
        return("Error: \(myURLString) doesn't seem to be a valid URL") //else return error
    }
    
    do {
        let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
        return("HTML : \(myHTMLString)")
    } catch let error {
        return("Error: \(error)")
    }
}

let text = getInfo() //assigns page source to variable

func shortenPageSource() -> Substring {
   // print(text.count) //print length of page source
    //shorten page source
    let start = text.index(text.startIndex, offsetBy: 60000)
    let end = text.index(text.endIndex, offsetBy: -12000)
    let range = start..<end
    let shorter = text[range]
    return shorter
}


func findCoin() -> Int {
    var index = 0
    let coin = test
    let shortSource = shortenPageSource()
    for char in shortSource {
        if coin.first == char {
            let startOfFoundCharacter = shortSource.index(shortSource.startIndex, offsetBy: index)
            let lengthOfFoundCharacter = shortSource.index(shortSource.startIndex, offsetBy: (coin.count + index))
            let range = startOfFoundCharacter..<lengthOfFoundCharacter
            if shortSource[range] == coin {
                return(index)
                
            }
        }
        index += 1
    }
    return(0)
}


func shortenAgain() -> Substring {
    let start = text.index(text.startIndex, offsetBy: 60000+findCoin())
    let end = text.index(text.endIndex, offsetBy: -12000)
    let range = start..<end
    let shorter = text[range]
    return shorter
}

// Loop through parent string looing for the first character of the substring
func findValue() -> Substring {
    var index = 0
    let goal = "#markets"
    let shortSource = shortenAgain()
    for char in shortSource {
        if goal.first == char {
            // Create a start and end index to ultimately creata range
            //
            // Hello Agnosticdev, I love Tutorials
            //       6   ->   17 - rage of substring from 7 to 18
            //
            let startOfFoundCharacter = shortSource.index(shortSource.startIndex, offsetBy: index)
            let lengthOfFoundCharacter = shortSource.index(shortSource.startIndex, offsetBy: (goal.count + index))
            let range = startOfFoundCharacter..<lengthOfFoundCharacter
        
            // Grab the substring from the parent string and compare it against substring
            // Essentially, looking for the needle in a haystack
            if shortSource[range] == goal {
                break
            }
        }
        index += 1
    }
    let start = shortSource.index(shortSource.startIndex, offsetBy: index+34)
    let end = shortSource.index(shortSource.startIndex, offsetBy: index+34+14)
    let range = start..<end
    let string1 = shortSource[range]
    return(string1)
}
print(findValue())



