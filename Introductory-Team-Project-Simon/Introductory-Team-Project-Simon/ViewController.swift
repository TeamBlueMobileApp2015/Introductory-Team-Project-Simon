import UIKit

class ViewController: UIViewController {

    private var game = SimonGame()
    private let soundAdapter = SoundAdapter()
    private let highScoreAdapter = HighscoreAdapter()
    
    @IBOutlet weak var current_score: UITextField!
    @IBOutlet weak var highscore: UITextField!
    @IBOutlet weak var greenButton: SOXShapedTapButton!
    @IBOutlet weak var redButton: SOXShapedTapButton!
    @IBOutlet weak var yellowButton: SOXShapedTapButton!
    @IBOutlet weak var blueButton: SOXShapedTapButton!
    
    internal enum Buttons : Int {
        case Green = 0
        case Red = 1
        case Yellow = 2
        case Blue = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.game.getPattern())
        self.highscore.text = String(self.highScoreAdapter.GetHighScore())
        self.showPattern(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Innitiates a new game
    @IBAction func NewGame_Tap(sender: UIButton) {
        self.game = SimonGame()
        self.current_score.text = "0"
        print(self.game.getPattern())
        //self.showPattern(0)
        delayPattern()
    }
    
    //Checks game on each button click
    @IBAction func clicked_Button(sender: UIButton) {

        let buttonClicked = sender.tag
        playSound(buttonClicked)

        let finishedRound = self.game.clickedButton(buttonClicked)

        if self.game.gameWon {
            let alert = UIAlertController(title: "Winner Winner Chicken Dinner", message: "You Won! :D", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }

        if self.game.gameLost {
            let alert = UIAlertController(title: "Game Over", message: "You Lost!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        if finishedRound {
            self.updateScore()
            delayPattern()
        }
        
    }
    
    func updateScore() {
        self.current_score.text = String(self.game.getLevel())
        if self.game.getLevel() > highScoreAdapter.GetHighScore() {
            highScoreAdapter.SetHighScore(self.game.getLevel())
        }
    }
    
    func getButton(buttonNumber : Int) -> UIButton? {
        
        switch(buttonNumber) {
        case Buttons.Green.rawValue:
            return greenButton
        case Buttons.Blue.rawValue:
            return blueButton
        case Buttons.Red.rawValue:
            return redButton
        case Buttons.Yellow.rawValue:
            return yellowButton
        default:
            return nil
        }
    }
    
    //Plays the sound designated for the color code
    func playSound(buttonClicked: Int){
        switch buttonClicked{
            case 0: self.soundAdapter.PlaySound(Buttons.Green.rawValue)
            case 1: self.soundAdapter.PlaySound(Buttons.Red.rawValue)
            case 2: self.soundAdapter.PlaySound(Buttons.Yellow.rawValue)
            case 3: self.soundAdapter.PlaySound(Buttons.Blue.rawValue)
        default: break
        }
    }
    
    func delayPattern() {
        let seconds = 1.0
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            
            self.showPattern(0)
            
        })
    }
    
    //Run through the pattern demonstrating it for the user
    func showPattern(currentButton : Int){
        
        let pattern = self.game.getPattern()
        
        let btn = self.getButton(pattern[currentButton])
        
        if currentButton == self.game.getLevel() {
            return
        }
        
        UIView.animateWithDuration(0.5,
            delay: 1.0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.playSound(currentButton)
                btn?.alpha = 0.99
                btn?.highlighted = true
            },
            completion: { finished in
                UIView.animateWithDuration(0.5,
                    delay: 0.0,
                    options: UIViewAnimationOptions.CurveLinear,
                    animations: {
                        btn?.alpha = 1.0
                        btn?.highlighted = false
                    },
                    completion: { finished in
                        self.showPattern(currentButton + 1)
                    }
                    
                )
            }
        )
    }

}