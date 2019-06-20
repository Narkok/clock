import UIKit

@IBDesignable
class Digit: UIView {
    
    var clockSize = CGFloat()
    var clocks = [[Clock]]()

    var installed = false
    
    override func draw(_ rect: CGRect) {
        
        if installed { return }
        installed = true
        
        clockSize = bounds.width / 4

        for i in 0..<24 {
            let clock = Clock()
            clock.backgroundColor = UIColor.white
            addSubview(clock)
            
            let xPos = clockSize * CGFloat(i % 4)
            let yPos = clockSize * CGFloat(i / 4)
            clock.frame = CGRect(x: xPos, y: yPos, width: clockSize, height: clockSize)
            
            if (i % 4 == 0) { clocks.append([]) }
            clocks[i / 4].append(clock)
        }
        
    }
    
    func showDigit(digit: Int) {
        
        let digitArray = DigitArray(from: digit)
        
        for i in 0..<clocks.count {
            for j in 0..<clocks[i].count {
                clocks[i][j].rotate(angle1: digitArray.array[i][j].a, angle2: digitArray.array[i][j].b)
            }
        }
        
    }
    
}


struct DigitArray {
    
    var array = [[(a: Int, b: Int)]]()
    
    init(from digit: Int) {
        if (digit == 0) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 4), (2, 4), (4, 6), (0, 4)])
            array.append([(0, 4), (0, 4), (0, 4), (0, 4)])
            array.append([(0, 4), (0, 4), (0, 4), (0, 4)])
            array.append([(0, 4), (0, 2), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
        if (digit == 1) {
            array.append([(2, 4), (2, 6), (4, 6), (5, 5)])
            array.append([(0, 2), (4, 6), (0, 4), (5, 5)])
            array.append([(5, 5), (0, 4), (0, 4), (5, 5)])
            array.append([(5, 5), (0, 4), (0, 4), (5, 5)])
            array.append([(2, 4), (6, 0), (0, 2), (4, 6)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
        if (digit == 2) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 2), (2, 6), (6, 4), (0, 4)])
            array.append([(2, 4), (2, 6), (6, 0), (0, 4)])
            array.append([(0, 4), (2, 4), (2, 6), (6, 0)])
            array.append([(0, 4), (0, 2), (2, 6), (4, 6)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
        if (digit == 3) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 2), (2, 6), (6, 4), (0, 4)])
            array.append([(2, 4), (2, 6), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (6, 4), (0, 4)])
            array.append([(2, 4), (2, 6), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
        if (digit == 4) {
            array.append([(2, 4), (4, 6), (2, 4), (4, 6)])
            array.append([(0, 4), (0, 4), (0, 4), (0, 4)])
            array.append([(0, 4), (0, 2), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (6, 4), (0, 4)])
            array.append([(5, 5), (5, 5), (0, 4), (0, 4)])
            array.append([(5, 5), (5, 5), (0, 2), (6, 0)])
            return
        }
        if (digit == 5) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 4), (2, 4), (2, 6), (6, 0)])
            array.append([(0, 4), (0, 2), (2, 6), (4, 6)])
            array.append([(0, 2), (2, 6), (6, 4), (0, 4)])
            array.append([(2, 4), (2, 6), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
        if (digit == 6) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 4), (2, 4), (2, 6), (6, 0)])
            array.append([(0, 4), (0, 2), (2, 6), (4, 6)])
            array.append([(0, 4), (2, 4), (4, 6), (0, 4)])
            array.append([(0, 4), (0, 2), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
        if (digit == 7) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 2), (2, 6), (6, 4), (0, 4)])
            array.append([(5, 5), (5, 5), (0, 4), (0, 4)])
            array.append([(5, 5), (5, 5), (0, 4), (0, 4)])
            array.append([(5, 5), (5, 5), (0, 4), (0, 4)])
            array.append([(5, 5), (5, 5), (0, 2), (6, 0)])
            return
        }
        if (digit == 8) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 4), (2, 4), (4, 6), (0, 4)])
            array.append([(0, 3), (0, 2), (6, 0), (0, 5)])
            array.append([(1, 4), (2, 4), (4, 6), (7, 4)])
            array.append([(0, 4), (0, 2), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
        if (digit == 9) {
            array.append([(2, 4), (2, 6), (2, 6), (4, 6)])
            array.append([(0, 4), (2, 4), (4, 6), (0, 4)])
            array.append([(0, 4), (0, 2), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (6, 4), (0, 4)])
            array.append([(2, 4), (2, 6), (6, 0), (0, 4)])
            array.append([(0, 2), (2, 6), (2, 6), (6, 0)])
            return
        }
    }
}
