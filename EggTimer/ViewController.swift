
















import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var fryProgress: UIProgressView!
    
    let eggTimes = ["Soft":30,"Medium":4,"Hard":7]
    var timeRemaining: Int = 0
    var progressTick: Float?;
    var timer = Timer();
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        timeRemaining = eggTimes[hardness]!
        progressTick = Float(1.0 / Float(timeRemaining))
        
        fryProgress.progress = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
    }
    
    @objc func countdown(){
        if(timeRemaining>0){
            print(timeRemaining)
            timeRemaining -= 1
            fryProgress.progress += progressTick!
        }
        else{
            timer.invalidate()
            mainLabel.text = "Done!"
        }
    }

}
