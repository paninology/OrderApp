//
//  OrderConfirmationViewController.swift
//  OderApp
//
//  Created by yongseok lee on 2022/05/03.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    var minutesToPrepare: Int

 
    var timeLeft = 60
  
    
    @IBOutlet weak var confirmationLAbel: UILabel!
   
    @IBOutlet weak var progressView: UIProgressView!
    
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmationLAbel.text = "Thank you for your order! Your wait time is approximately \(minutesToPrepare) minutes."
        onTimerFires(timeLeft: minutesToPrepare)
        // Do any additional setup after loading the view.
    }
    
    func timeUpdate() {
        confirmationLAbel.text = " minetes left "
    }
    
    @objc func onTimerFires(timeLeft: Int)
    {
        self.timeLeft = timeLeft
        let alertController = UIAlertController(title: "Wait time", message: "10 minutes left", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        
        Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { (Timer) in
                if self.timeLeft > 0 {
                    self.timeLeft -= 1
                    let totalProgress = Float(self.timeLeft) / Float((self.minutesToPrepare))
                    print ("\(self.timeLeft) seconds",self.minutesToPrepare, totalProgress)
                    self.confirmationLAbel.text = "Your wait time is approximately \(self.timeLeft) minutes."
                    self.progressView.setProgress((1 - totalProgress), animated: true)
                    if self.timeLeft == 10 {
                        self.present(alertController, animated: true, completion: nil)
                    }
                } else {
                    Timer.invalidate()
                }
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
