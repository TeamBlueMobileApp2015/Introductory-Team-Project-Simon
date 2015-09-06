import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testing(){
        //Creating of SimonGame object
        let game = SimonGame()
        game.printCorrectPattern()
        
        //Creates a copy of that patern [Int[
        let pattern = game.getPattern()
        print(pattern.description)
    }
}

