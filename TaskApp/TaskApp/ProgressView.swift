//
//  ProgressView.swift
//  TaskApp
//
//  Created by jean on 26/5/2562 BE.
//  Copyright © 2562 Madeleine Gillard. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    @IBInspectable public  var trackCircleColor: UIColor = UIColor.lightGray
    
    @IBInspectable public  var startGradientColor: UIColor = UIColor.blue
    
    @IBInspectable public  var endGradientColor: UIColor = UIColor.green
    
    @IBInspectable public  var textColor: UIColor = UIColor.black
    
    private var progressLayer: CAShapeLayer!
    
    private var trackLayer: CAShapeLayer!
    
    private var textLayer: CATextLayer!
    
    private var gradientLayer: CAGradientLayer!
    
    var progress: CGFloat = 0 {
        
        didSet{
            
            didProgressUpdate()
            
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let width = rect.width
        
        let height = rect.height
        
        let lineWidth = 0.1 * min(width, height)
        
        trackLayer = createCircularPath(rect: rect, strokecolor: trackCircleColor.cgColor, fillColor: UIColor.clear.cgColor, linewidth: lineWidth)
        
        progressLayer = createCircularPath(rect: rect, strokecolor: UIColor.blue.cgColor, fillColor: UIColor.clear.cgColor, linewidth: lineWidth)
        
        gradientLayer = CAGradientLayer()
        
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        
        gradientLayer.colors = [startGradientColor.cgColor, endGradientColor.cgColor]
        
        gradientLayer.frame = rect
        
        gradientLayer.mask = progressLayer
        
        textLayer = createTextLayer(rect: rect, textColor: textColor.cgColor)
        
        layer.addSublayer(trackLayer)
        
        layer.addSublayer(gradientLayer)
        
        layer.addSublayer(textLayer)
    }
    
    private func createCircularPath(rect: CGRect, strokecolor: CGColor, fillColor: CGColor, linewidth: CGFloat) -> CAShapeLayer {
        
        let width = rect.width
        
        let height = rect.height
        
        let center = CGPoint(x: width / 2, y: height / 2)
        
        let radius = (min(width, height) - linewidth) / 2
        
        let startAngle = -CGFloat.pi / 2
        
        let endAngle = startAngle + 2 * CGFloat.pi
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = strokecolor
        
        shapeLayer.fillColor = fillColor
        
        shapeLayer.lineWidth = linewidth
        
        shapeLayer.lineCap = .round
        
        return shapeLayer
        
    }
    
    func createTextLayer(rect: CGRect, textColor: CGColor) -> CATextLayer{
        
        let width = rect.width
        
        let height = rect.height
        
        let fontSize = min(width, height) / 4
        
        let offset = min(width, height) * 0.1
        
        let layer = CATextLayer()
        
        layer.string = "\(Int(progress * 100))%"
        
        layer.backgroundColor = UIColor.clear.cgColor
        
        layer.foregroundColor = textColor
        
        layer.fontSize = fontSize
        
        layer.frame = CGRect(x: 0, y: (height - fontSize - offset) / 2, width: width, height: fontSize + offset)
        
        layer.alignmentMode = .center
        
        return layer
        
    }
    
    func didProgressUpdate(){
        
        textLayer?.string = "\(Int(progress * 100))%"
        
        progressLayer?.strokeEnd = progress
        
    }
}
