//
//  ViewController.swift
//  JYMLoginView
//
//  Created by zzq on 2018/5/29.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var c1: CardView!
    var c2: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var mat = CATransform3DIdentity;
        mat.m34 = -1/500.0;
        
        
       c1 = CardView(frame: CGRect(x: 10, y: 200, width: 355, height: 250), target: self, action: #selector(btnEvent2))
        c1.layer.transform = CATransform3DTranslate(mat, 0, 0, 0)
        self.view.addSubview(c1)

        
        c2 = CardView(frame: CGRect(x: 10, y: 200, width: 355, height: 250), target: self, action: #selector(btnEvent))
        c2.layer.transform = CATransform3DTranslate(mat, 0, 100, -100)
        self.view.insertSubview(c2, belowSubview: c1)
        c2.btn.setTitle("btn2", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func btnEvent(btn: UIButton) {
       
        var mat = CATransform3DIdentity;
        mat.m34 = -4.5/2000.0;
        UIView.animate(withDuration: 1) {
           
            self.c1.layer.transform = CATransform3DTranslate(mat, 0, 100, -100)
//
            self.c2.layer.transform = CATransform3DTranslate(mat, 0, 0, 0)
            
        }
       
    }
    
    @objc func btnEvent2(btn: UIButton) {
       
        var mat = CATransform3DIdentity;
        mat.m34 = -4.5/2000.0;
        UIView.animate(withDuration: 1) {
            self.c2.layer.transform = CATransform3DTranslate(mat, 0, 100, -100)
            //
            self.c1.layer.transform = CATransform3DTranslate(mat, 0, 0, 0)
            
        }
    }
}

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class CardView: UIView {
    
    var backView: UIView!
    var fontView: UIView!
    var btn: UIButton!
    
    init(frame: CGRect, target: Any?, action: Selector) {
        super.init(frame: frame)
        
        backView = UIView(frame: self.bounds)
        self.addSubview(backView)
        let shape = CAShapeLayer()
        backView.layer.addSublayer(shape)
        shape.frame = backView.bounds
        shape.fillColor = UIColor.randomColor().cgColor
        
        let path = CGMutablePath()
        
        
        let radius1: CGFloat = 25
        let w1: CGFloat = self.width*0.5-radius1-50
        
        
        let p1 = CGPoint(x: 50, y: 0)
        let p2 = CGPoint(x: w1+50.0, y: 0)
        let p3 = CGPoint(x: self.width*0.5, y: 0)
//        let p4 = CGPoint(x: self.width*0.5+radius, y: 0)
        let p5 = CGPoint(x: self.width-50, y: 0)
        let p6 = CGPoint(x: self.width-50, y: 10)
        let p7 = CGPoint(x: self.width-40, y: self.height-10)
        
        let p8 = CGPoint(x: self.width-50, y: self.height-10)
        let p9 = CGPoint(x: 50, y: self.height)
        let p10 = CGPoint(x: 50, y: self.height-10)
        let p11 = CGPoint(x: 40, y: 10)
        let p12 = CGPoint(x: 50, y: 10)
        
        path.move(to: p1)
        path.addLine(to: p2)
        
        path.addArc(center: p3, radius: radius1, startAngle: -.pi, endAngle: 0, clockwise: true)
        path.addLine(to: p5)
        
        path.addArc(center: p6, radius: 10, startAngle: -.pi*0.5, endAngle: 0, clockwise: false)
        path.addLine(to: p7)
        
        path.addArc(center: p8, radius: 10, startAngle: 0, endAngle: -.pi*1.5, clockwise: false)
        path.addLine(to: p9)
        
        path.addArc(center: p10, radius: 10, startAngle: -.pi*1.5, endAngle: -.pi, clockwise: false)
        path.addLine(to: p11)
        
        path.addArc(center: p12, radius: 10, startAngle: -.pi, endAngle: -.pi*0.5, clockwise: false)
        shape.path = path

        //阴影
        shape.shadowPath = path
        shape.shadowColor = UIColor.gray.cgColor
        shape.shadowOpacity = 1
        
        btn = UIButton(frame: CGRect(x: self.width/2-30, y: self.height-60, width: 60, height: 40))
        self.addSubview(btn)
        btn.setTitle("Button", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
