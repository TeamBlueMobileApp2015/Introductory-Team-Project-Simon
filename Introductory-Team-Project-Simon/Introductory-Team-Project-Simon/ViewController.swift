import UIKit

class ViewController: UIViewController {

    private var game = SimonGame()
    private let soundAdapter = SoundAdapter()
    
    public enum Buttons : Int {
        case Green = 0
        case Red = 1
        case Yellow = 2
        case Blue = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.game.getPattern())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testing(){
    }
    
    @IBAction func NewGame_Tap(sender: UIButton) {
        self.game = SimonGame()
        self.current_score.text = "0"
        print(self.game.getPattern())
    }
    
    //GREEN Button
    // Value 0
    @IBAction func Green_Button_Tap(sender: UIButton) {
        print("0 - Green Button")
        self.clicked_Button(Buttons.Green.rawValue)
        self.soundAdapter.PlaySound(Buttons.Green.rawValue)
    }
    @IBAction func Green_Button_Release(sender: UIButton) {
        print("-Green Button")
    }
    
    //RED Button
    // Value 1
    @IBAction func Red_Button_Tap(sender: UIButton) {
        print("1 - Red Button")
        self.clicked_Button(Buttons.Red.rawValue)
        self.soundAdapter.PlaySound(Buttons.Red.rawValue)
    }
    @IBAction func Red_Button_Release(sender: UIButton) {
        print("-Red Button")
    }
    
    //YELLOW Button
    // Value 2
    @IBAction func Yellow_Button_Tap(sender: UIButton) {
        print("2 - Yellow Button")
        self.clicked_Button(Buttons.Yellow.rawValue)
        self.soundAdapter.PlaySound(Buttons.Yellow.rawValue)
    }
    @IBAction func Yellow_Button_Release(sender: UIButton) {
        print("-Yellow Button")
    }
    
    //BLUE Button
    // Value 3
    @IBAction func Blue_Button_Tap(sender: UIButton) {
        print("3 - Blue Button")
        self.clicked_Button(Buttons.Blue.rawValue)
        self.soundAdapter.PlaySound(Buttons.Blue.rawValue)
    }
    
    @IBAction func Blue_Button_Release(sender: UIButton) {
        print("-Blue Button")
    }
    
    @IBOutlet weak var highscore: UITextField!
    
    @IBOutlet weak var current_score: UITextField!
    
    func clicked_Button(buttonClicked : Int) {
        if self.game.gameOver() {
            return
        }
        if self.game.checkMove(buttonClicked) {
            self.current_score.text = String(self.game.getScore())
        }
        
        // Add in highest score check here...
        // Use HighscoreAdapter
        
        if self.game.hasLostTheGame() {
            let alert = UIAlertView()
            alert.title = "Game over!"
            alert.message = "You Lost! :("
            alert.addButtonWithTitle("Okay")
            alert.show()
        }
        
        if self.game.hasWon() {
            let alert = UIAlertView()
            alert.title = "Winner Winner Chicken Dinner"
            alert.message = "You Won! :D"
            alert.addButtonWithTitle("Okay")
            alert.show()
        }
        
    }
    
}

