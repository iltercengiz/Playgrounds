

import UIKit

/*:
# Protocol-Oriented Programming
The goal is to build a View that we can style differently, depending on where it is used. 
But we want our view to have default styles as well!
In past, you might have accomplished this using subclassing. 
However, we're going to use Protocols instead!
*/

/*:
Our protocol currently has all the styling attributes for the outer and inner square of our view.
### Task: Add a few more styling UIView customizable styling options to the protocol!

*/

protocol SquareInSquareViewStylingDelegate {
    
    var outerBackgroundColor: UIColor { get }
    var outerBorderColor: UIColor { get }
    var outerBorderWidth: CGFloat { get }
    
    var innerBackgroundColor: UIColor { get }
    var innerBorderColor: UIColor { get }
    var innerBorderWidth: CGFloat { get }
}

/*:
With Protocol Extensions, we can set the default function implementation to our protocol
### Task: Change the return values and see what happens to the view below. Add default values for your customized styling options!
*/

extension SquareInSquareViewStylingDelegate {
    
    var outerBorderColor: UIColor {
        return .greenColor()
    }
    
    var outerBorderWidth: CGFloat {
        return 1.0 as CGFloat
    }
    
    var innerBorderColor: UIColor {
        return .yellowColor()
    }
    
    var innerBorderWidth: CGFloat {
        return 1.0 as CGFloat
    }
}

/*:
This is the view that will implement the protocol. 
*/

class SquareInSquareView: UIView {
    private let innerView = UIView(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
    
    // Ideally, we would set the delegate in the init methods, 
    // but UIKit doesn't make it easy to set custom initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(innerView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(innerView)
    }
        
    // So we're going to add a seperate method for styling via the protocol here!
    func configureWithStylingDelegate(stylingDelegate: SquareInSquareViewStylingDelegate) {
        backgroundColor = stylingDelegate.outerBackgroundColor
        layer.borderWidth = stylingDelegate.outerBorderWidth
        layer.borderColor = stylingDelegate.outerBorderColor.CGColor
        
        innerView.backgroundColor = stylingDelegate.innerBackgroundColor
        innerView.layer.borderWidth = stylingDelegate.innerBorderWidth
        innerView.layer.borderColor = stylingDelegate.innerBorderColor.CGColor
    }
}

/*:
Now we set the style we'd like. 
Notice that only the non-default values are configured.
### Task: Add different colors / widths for the borders around the two squares
*/
struct PurpleInBlueSquareStyle: SquareInSquareViewStylingDelegate {
    
    var outerBackgroundColor: UIColor {
        return .blueColor()
    }
    
    var innerBackgroundColor: UIColor {
        return .purpleColor()
    }
}

let purpleInBlueSaquareView = SquareInSquareView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
purpleInBlueSaquareView.configureWithStylingDelegate(PurpleInBlueSquareStyle())

/*:
Notice that we did not have to subclass our view to create this style.
### Task: Create more views with varying styles without subclassing.
*/

// your fun views here!






