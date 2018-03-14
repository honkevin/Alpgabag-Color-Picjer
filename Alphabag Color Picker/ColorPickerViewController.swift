//
//  ColorPickerViewController.swift
//  Alphabag Color Picker
//
//  Created by HON Chi Hang on 13/3/2018.
//  Copyright © 2018 Alpgabag. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet weak var bgColor: UIView!
    @IBOutlet weak var pointX: UILabel!
    @IBOutlet weak var pointY: UILabel!
    
    var pointXval = 0 {
        didSet {
            pointX.text = "X Pos(S): \(pointXval)"
        }
    }
    
    
    var pointYval = 0 {
        didSet {
            pointY.text = "Y Pos(B): \(pointYval)"
        }
    }
    
    
    var hueVal:CGFloat = 0
    var saturationVal:CGFloat = 0
    var brightnessVal:CGFloat = 0
    var alphaVal:CGFloat = 0
    
    
    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer){
        
//Get X, Y position value
        for i in 0 ..< sender.numberOfTouches{
            let point = sender.location(ofTouch: i, in: sender.view)
            
            pointXval = Int(point.x)
            pointYval = Int(point.y)
            
            print("Finger: \(i), X Position:(\(pointXval)), Y Position:(\(pointYval))")
        }
        
        
//Change Color Saturation and Brightness
        let pointXvalFloat = CGFloat(pointXval)
        let pointYvalFloat = CGFloat(pointYval)
        
        saturationVal = pointYvalFloat/view.frame.height
        brightnessVal = pointXvalFloat/view.frame.width
        
        bgColor.backgroundColor = UIColor.init(hue: hueVal, saturation: saturationVal, brightness: brightnessVal , alpha: 1)
        
        print("Hue: \(hueVal), Saturation: \(saturationVal),Brightness: \(brightnessVal) ")
        
    }
    
 
    @IBOutlet var colorBtn: [UIButton]!
    @IBAction func colorBtnPressed(_ sender: UIButton) {

        getBtnBgColHSBVal(button: sender)
        
        switchColor(background: bgColor, button: sender, hue: hueVal, saturation: saturationVal, brightness: brightnessVal)
    }
    
    
    func getBtnBgColHSBVal (button ButtonName: UIButton){
        
        ButtonName.backgroundColor?.getHue(&hueVal, saturation: &saturationVal, brightness: &brightnessVal, alpha: &alphaVal)
        
    }
    
    
    func switchColor(background BgView: UIView, button ButtonName: UIButton, hue:CGFloat, saturation:CGFloat, brightness:CGFloat ){
        
        ButtonName.backgroundColor = UIColor.init(hue: hueVal, saturation: saturationVal, brightness: brightnessVal , alpha: 1)
        BgView.backgroundColor = ButtonName.backgroundColor
        
    }
    
    func getViewBgColHSBVal (view ViewName: UIView){
        
        ViewName.backgroundColor?.getHue(&hueVal, saturation: &saturationVal, brightness: &brightnessVal, alpha: &alphaVal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getViewBgColHSBVal(view: bgColor)
    }
}




