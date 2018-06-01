//
//  ViewController2.swift
//  JYMLoginView
//
//  Created by zzq on 2018/6/1.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var arr:[CardView] = []
    var selected = false
    var mat:CATransform3D!
    var oPoint: CGPoint!
    var center: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mat = CATransform3DIdentity;
        mat.m34 = -1/500.0;
        
        for i in 0..<5 {
            let c1 = CardView(frame: CGRect(x: 10, y: 200, width: 355, height: 250), target: self, action: #selector(btnEvent))
            c1.layer.transform = CATransform3DTranslate(mat, 0,  -CGFloat(-i*30), CGFloat(-i*30))
            self.view.addSubview(c1)
            arr.append(c1)
        }
        
       center = arr[0].center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func btnEvent() {
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let p = touches.first?.location(in: self.view)
        
        
        
        if arr[0].frame.contains(p!) {
            selected = true
            oPoint = p!
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if selected {
            let p = touches.first?.location(in: self.view)
            let y = oPoint.y - p!.y
            let x = oPoint.x - p!.x
            
            arr[0].centerY =  center.y - y
            arr[0].centerX =  (center.x - x)
            arr[0].layer.transform = CATransform3DRotate(mat, x/center.x*(.pi), 0, 0, 1)
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        selected = false
        
//        if center.x-arr[0].centerX>100 { //remove
//            UIView.animate(withDuration: 0.3, animations: {
//                
//            }, completion: {
//                
//            })
//        }else {
//            UIView.animate(withDuration: 0.3, animations: {
//                self.arr[0].center = self.center
//               self.arr[0].layer.transform = CATransform3DRotate(self.mat, 0, 0, 0, 0)
//            }, completion: {
//                
//            })
//        }
       
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
