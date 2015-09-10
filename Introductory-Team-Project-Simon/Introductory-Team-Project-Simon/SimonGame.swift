import Foundation

class SimonGame{
    
    //Contains the random pattern that will be displayed
    private var pattern = [Int]()
    private var gamePosition : Int = 0;
    private var hasLost : Bool = false;
    
    init(){
        self.createPattern(12)
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
    
    func checkMove(move : Int) -> Bool {
        // Since this is a post increment, it will increment after the value is accessed.
        return (Bool)(self.hasLost = (self.getPattern()[self.gamePosition++] != move))
    }
    
    func gameOver() -> Bool {
        // If the user has lost the game is over, if the game position is greater than pattern than the user has obviously won
        // and henceforth the game is over. This is to be combined with hasLost
        return (self.gamePosition >= pattern.count) || self.hasLost
    }
    
    // This must be combined with gameOver to determine if the user has won
    func hasLostTheGame() -> Bool {
        return self.hasLost
    }
    
}