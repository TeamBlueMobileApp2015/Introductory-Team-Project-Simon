import Foundation

class SimonGame{
    
    //Contains the random pattern that will be displayed
    private var pattern = [Int]()
    private var level = 1
    private var endLevel = 12
    private var currentButton = 0
    public var gameWon = false
    public var gameLost = false
    
    init(endLevel : Int = 12){
        self.endLevel = endLevel
        self.createPattern(self.endLevel)
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
    
    func getLevel() -> Int {
        return self.level
    }
    
    func getCurrentButton() -> Int {
        return self.currentButton
    }
    
    //Returns the pattern as an int array
    func getPattern()->[Int]{
        return pattern
    }
    
    func clickedButton(buttonNumber : Int) -> Bool {
        
        if buttonNumber == pattern[currentButton] {
            currentButton++
        } else {
            self.gameLost = true
            return true
        }
        
        if currentButton == level {
            self.currentButton = 0
            level++
            return true
        }
        
        if level == endLevel {
            self.gameWon = true
            return true
        }
        
        return false
        
    }
    
}