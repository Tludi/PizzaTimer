//
//  TimerViewController.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/1/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var singlePizza = Pizza()
    var customPizza = CustomPizza()
    let shapeLayer = CAShapeLayer()
    var baseTime = 0
    var totalTime = 0
    var timer: Timer!
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var customLabel: UILabel!
    
    @IBOutlet weak var startTimerButtonOutlet: UIButton!
    @IBAction func startTimerButton(_ sender: UIButton) {
        print("tapped start button")
        handleTap(reset: false)
        resumeButtonOutlet.isHidden = true
        pauseButtonOutlet.isHidden = false
        startTimerButtonOutlet.isHidden = true
        resetTimerOutlet.isHidden = true
    }
    
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    @IBAction func pauseButton(_ sender: UIButton) {
        pauseTimer()
        resumeButtonOutlet.isHidden = false
        pauseButtonOutlet.isHidden = true
        startTimerButtonOutlet.isHidden = true
        resetTimerOutlet.isHidden = false
    }
    
    @IBOutlet weak var resumeButtonOutlet: UIButton!
    @IBAction func resumeButton(_ sender: UIButton) {
        resumeTimer()
        resumeButtonOutlet.isHidden = true
        pauseButtonOutlet.isHidden = false
        startTimerButtonOutlet.isHidden = true
        resetTimerOutlet.isHidden = true
    }
    
    @IBOutlet weak var resetTimerOutlet: UIButton!
    @IBAction func resetTimerButton(_ sender: UIButton) {
        resetTimer()
        startTimerButtonOutlet.isHidden = false
        pauseButtonOutlet.isHidden = true
        resumeButtonOutlet.isHidden = true
        resetTimerOutlet.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseTime = Int(singlePizza.cookingTime)! //* 60 //remove the * 60 for shorter test times
        totalTime = baseTime
        pauseButtonOutlet.isHidden = true
        resumeButtonOutlet.isHidden = true
        startTimerButtonOutlet.isHidden = false
        resetTimerOutlet.isHidden = false
        
        print("From the Timer view")
        print(singlePizza.name)
        print(customPizza.name)
        
        if singlePizza.id != "defaultID" {
            nameLabel.text = singlePizza.name
            brandLabel.text = singlePizza.brand
            timeLabel.text = timeFormatted(totalTime)
            tempLabel.text = singlePizza.temperature
        } else {
            nameLabel.text = customPizza.name
            brandLabel.text = customPizza.brand
            timeLabel.text = customPizza.cookingTime
            tempLabel.text = customPizza.temperature
            
        }
        
        customLabel.text = "custom label to use or remove"
        timerRingLayer()
    }
    
    // seperate out into individual functions
    func timerRingLayer() {
        let center = view.center
        
        // track layer
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor

        
        // animated time path

        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = kCALineCapRound
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
    }
        

    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timer.fire()
        
    }
    
    @objc func updateTimer() {
        timeLabel.text = "\(timeFormatted(totalTime))"
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
        let pausedTime = shapeLayer.convertTime(CACurrentMediaTime(), from: nil)
        shapeLayer.speed = 0.0
        shapeLayer.timeOffset = pausedTime
    }
    
    
    func resumeTimer() {
        startTimer()
        let pausedTime = shapeLayer.timeOffset
        shapeLayer.speed = 1.0
        shapeLayer.timeOffset = 0.0
        shapeLayer.beginTime = 0.0
        let timeSincePause = shapeLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        shapeLayer.beginTime = timeSincePause
    }
    
    func endTimer() {
        timer.invalidate()
        totalTime = baseTime
        timeLabel.text = "Done!"
        
        startTimerButtonOutlet.isHidden = true
        pauseButtonOutlet.isHidden = true
        resumeButtonOutlet.isHidden = true
        resetTimerOutlet.isHidden = false
    }
    
    func resetTimer() {
        timer.invalidate()
//        handleTap(reset: true)
        totalTime = baseTime
        timeLabel.text = timeFormatted(totalTime)
      view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds/60)%60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    @objc private func handleTap(reset:Bool) {
        print("tap tap tap")
        if reset == false {
            startTimer()
        }
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = CFTimeInterval(totalTime) + 1
        
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        

        
        shapeLayer.add(animation, forKey: "oatmeal")
    }



}
