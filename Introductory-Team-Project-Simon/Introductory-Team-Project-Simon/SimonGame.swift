import Foundation

class SimonGame{
    
    //Contains the random pattern that will be displayed
    private var pattern = [Int]()
    
    init(){
        createPattern(12)
    }
    
    //Fills the int array pattern with numbers from 0...1 
    //This will represent 0 = green, 1 = red, 2 = yellow, 3 = blue
    func createPattern(patternSize: Int){
        for _ in 0...patternSize-1{
           pattern.append(Int(arc4random_uniform(4)))
        }
    }
    
    //Prints the pattern to the console
    func printCorrectPattern(){
        print(pattern.description)
    }
    
    //Returns the pattern as an int array
    func getPattern()->[Int]{
        return pattern
    }
}

S