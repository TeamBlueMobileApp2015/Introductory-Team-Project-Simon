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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Innitiates a new game
    @IBAction func NewGame_Tap(sender: UIButton) {
        self.game = SimonGame()
        self.current_score.text = "0"
        print(self.game.getPattern())
        showPattern()
    }
    
    //GREEN Button
    // Value 0
    @IBAction func Green_Button_Tap(sender: UIButton) {
        imageSwitchPressed(Buttons.Green.rawValue)
        clicked_Button(Buttons.Green.rawValue)
        playSound(Buttons.Green.rawValue)
    }
    
    @IBAction func Green_Button_Release(sender: UIButton) {
        imageSwitch(Buttons.Green.rawValue)
    }
    
    //RED Button
    // Value 1
    @IBAction func Red_Button_Tap(sender: UIButton) {
        imageSwitchPressed(Buttons.Red.rawValue)
        clicked_Button(Buttons.Red.rawValue)
        playSound(Buttons.Red.rawValue)
    }
    
    @IBAction func Red_Button_Release(sender: UIButton) {
        imageSwitch(Buttons.Red.rawValue)
    }
    
    //YELLOW Button
    // Value 2
    @IBAction func Yellow_Button_Tap(sender: UIButton) {
        imageSwitchPressed(Buttons.Yellow.rawValue)
        clicked_Button(Buttons.Yellow.rawValue)
        playSound(Buttons.Yellow.rawValue)
    }
    
    @IBAction func Yellow_Button_Release(sender: UIButton) {
        imageSwitch(Buttons.Yellow.rawValue)
    }
    
    //BLUE Button
    // Value 3
    @IBAction func Blue_Button_Tap(sender: UIButton) {
        imageSwitchPressed(Buttons.Blue.rawValue)
        clicked_Button(Buttons.Blue.rawValue)
        playSound(Buttons.Blue.rawValue)
    }
    
    @IBAction func Blue_Button_Release(sender: UIButton) {
        imageSwitch(Buttons.Blue.rawValue)
    }
    
    //Checks game on each button click
    func clicked_Button(buttonClicked : Int) {
        if self.game.gameOver() {
            return
        }
        if self.game.checkMove(buttonClicked) {
            self.current_score.text = String(self.game.getScore())
        }
        
        // Add in highest score check here...
        if highScoreAdapter.GetHighScore() < self.game.getScore() {
            highScoreAdapter.SetHighScore(self.game.getScore())
            self.highscore.text = String(self.game.getScore())
        }
        
        if self.game.hasLostTheGame() {
            let alert = UIAlertController(title: "Game Over", message: "You Lost!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if self.game.hasWon() {
            let alert = UIAlertController(title: "Winner Winner Chicken Dinner", message: "You Won! :D", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    //Switches the buttons background to a normal state version
    func imageSwitch(buttonClicked : Int){
        switch buttonClicked{
            case 0: greenButton.setBackgroundImage(UIImage(named: "GreenButton"), forState: UIControlState.Normal)
            case 1: redButton.setBackgroundImage(UIImage(named: "RedButton"), forState: UIControlState.Normal)
            case 2: yellowButton.setBackgroundImage(UIImage(named: "YellowButton"), forState: UIControlState.Normal)
            case 3: blueButton.setBackgroundImage(UIImage(named: "BlueButton"), forState: UIControlState.Normal)
            default: break
        }
    }
    
    //Switches the buttons background to a pressed state version
    func imageSwitchPressed(buttonClicked : Int ){
        switch buttonClicked{
            case 0: greenButton.setBackgroundImage(UIImage(named: "GreenButtonPressed"), forState: UIControlState.Normal)
            case 1: redButton.setBackgroundImage(UIImage(named: "RedButtonPressed"), forState: UIControlState.Normal)
            case 2: yellowButton.setBackgroundImage(UIImage(named: "YellowButtonPressed"), forState: UIControlState.Normal)
            case 3: blueButton.setBackgroundImage(UIImage(named: "BlueButtonPressed"), forState: UIControlState.Normal)
            default: break
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
    
    //Run through the pattern demonstrating it for the user
    func showPattern(){
        let pattern = game.getPattern()
        for i in pattern{
            imageSwitchPressed(i)
            playSound(i)
            imageSwitch(i)
        }
    }

}