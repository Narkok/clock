import UIKit

class ViewController: UIViewController {
    
    let safeAreaView = UIView()
    var safeAreaWidth = Int()
    var safeAreaHeight = Int()
    
    var clockSize = Int()
    
    let hour   = (first: Digit(), second: Digit())
    let minute = (first: Digit(), second: Digit())
    let second = (first: Digit(), second: Digit())
    
    var frameClocks = [Clock]()
    
    var timer: Timer!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        createSafeArea()
        clockSize = Int(safeAreaWidth / 10)
        addDigits()
        start()
        
    }

    private func createSafeArea()  {
        view.addSubview(safeAreaView)
        
        let window = UIApplication.shared.keyWindow
        let maxPadding = max( Int(window?.safeAreaInsets.top ?? 0), Int(window?.safeAreaInsets.bottom ?? 0))
        
        let mainViewWidht = Int(view.bounds.width)
        let mainViewHeight = Int(view.bounds.height) - 2 * maxPadding
        
        if (mainViewHeight / mainViewWidht < 2) {
            safeAreaHeight = mainViewHeight
            safeAreaWidth = mainViewHeight / 2
            let safeAreaXPos = (mainViewWidht - safeAreaWidth) / 2
            safeAreaView.frame = CGRect(x: safeAreaXPos, y: maxPadding, width: safeAreaWidth, height: safeAreaHeight)
        }
        else {
            safeAreaWidth = mainViewWidht
            safeAreaHeight = mainViewWidht * 2
            let safeAreaYPos = (Int(view.bounds.height) - safeAreaWidth) / 2
            safeAreaView.frame = CGRect(x: 0, y: safeAreaYPos, width: safeAreaWidth, height: safeAreaHeight)
        }
    }
    
    private func createFrame() {
        for i in 0..<10 {
            
            let bottomClockYPos = safeAreaHeight - clockSize
            let clockXPos = clockSize * i
            
            let topClock = Clock()
            let bottomClock = Clock()
            
            topClock.frame = CGRect(x: clockXPos, y: 0, width: clockSize, height: clockSize)
            bottomClock.frame = CGRect(x: clockXPos, y: bottomClockYPos, width: clockSize, height: clockSize)
            
            safeAreaView.addSubview(topClock)
            safeAreaView.addSubview(bottomClock)
            
            frameClocks.append(topClock)
            frameClocks.append(bottomClock)
        }
        
        for i in 1..<19 {
            let rightClockXPos = safeAreaWidth - clockSize
            let clockYPos = clockSize * i
            
            let leftClock = Clock()
            let rightClock = Clock()
            
            leftClock.frame = CGRect(x: 0, y: clockYPos, width: clockSize, height: clockSize)
            rightClock.frame = CGRect(x: rightClockXPos, y: clockYPos, width: clockSize, height: clockSize)
            
            safeAreaView.addSubview(leftClock)
            safeAreaView.addSubview(rightClock)
            
            frameClocks.append(leftClock)
            frameClocks.append(rightClock)
        }
    }

    private func addDigits() {
        
        safeAreaView.addSubview(hour.first)
        safeAreaView.addSubview(hour.second)
        
        hour.first.frame = CGRect(x: clockSize, y: clockSize, width: 4*clockSize, height: 6*clockSize)
        hour.second.frame = CGRect(x: 5*clockSize, y: clockSize, width: 4*clockSize, height: 6*clockSize)
        
        safeAreaView.addSubview(minute.first)
        safeAreaView.addSubview(minute.second)
        
        minute.first.frame = CGRect(x: clockSize, y: 7*clockSize, width: 4*clockSize, height: 6*clockSize)
        minute.second.frame = CGRect(x: 5*clockSize, y: 7*clockSize, width: 4*clockSize, height: 6*clockSize)
        
        safeAreaView.addSubview(second.first)
        safeAreaView.addSubview(second.second)
        
        second.first.frame = CGRect(x: clockSize, y: 13*clockSize, width: 4*clockSize, height: 6*clockSize)
        second.second.frame = CGRect(x: 5*clockSize, y: 13*clockSize, width: 4*clockSize, height: 6*clockSize)
        
    }
    
    private func start() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }

    @objc func setTime(){
        let _hours   = Int(Calendar.current.component(.hour, from: Date()))
        let _minutes = Int(Calendar.current.component(.minute, from: Date()))
        let _seconds = Int(Calendar.current.component(.second, from: Date()))

        hour.first.showDigit(digit: _hours/10)
        hour.second.showDigit(digit: _hours%10)

        minute.first.showDigit(digit: _minutes/10)
        minute.second.showDigit(digit: _minutes%10)

        second.first.showDigit(digit: _seconds/10)
        second.second.showDigit(digit: _seconds%10)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

