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
    
    @IBAction func NewGame_Tap(sender: UIButton) {
        print("New Game");
    }
    
    //GREEN Button
    @IBAction func Green_Button_Tap(sender: UIButton) {
        print("0 - Green Button")
    }
    
    @IBAction func Green_Button_Release(sender: UIButton) {
        print("-Green Button")
    }
    
    //RED Button
    @IBAction func Red_Button_Tap(sender: UIButton) {
        print("1 - Red Button")
    }
    
    @IBAction func Red_Button_Release(sender: UIButton) {
        print("-Red Button")
    }
    
    //YELLOW Button
    @IBAction func Yellow_Button_Tap(sender: UIButton) {
        print("2 - Yellow Button")
    }
    
    @IBAction func Yellow_Button_Release(sender: UIButton) {
        print("-Yellow Button")
    }
    
    //BLUE Button
    @IBAction func Blue_Button_Tap(sender: UIButton) {
        print("4 - Blue Button")
    }
    
    @IBAction func Blue_Button_Release(sender: UIButton) {
        print("-Blue Button")
    }
    
    @IBOutlet weak var highscore: UITextField!
    
    @IBOutlet weak var current_score: UITextField!
}

