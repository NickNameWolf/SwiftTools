//
//  File.swift
//  UIViewC
//
//  Created by 刘树华 on 2017/9/7.
//  Copyright © 2017年 刘树华. All rights reserved.
//

import Foundation
import UIKit

struct BoderType : OptionSet {
    let rawValue: Int
    static let left = BoderType(rawValue: 1<<0)
    static let right = BoderType(rawValue: 1<<1)
    static let top = BoderType(rawValue: 1<<2)
    static let bottom = BoderType(rawValue: 1<<3)
}

extension UIView {

    func addLine (type:BoderType,width:Float,color:UIColor,layout:(()->())?)  {
        
        if self is UILabel {
            if self.superview != nil{
                assert(false, "Before add label to superView , must call layoutIfNeeded")
            }
            assert(layout != nil, "Before add label to superView , call layoutIfNeeded")
        }
        
        layout?()
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = color
        line.frame = CGRect(x: 0, y: 0, width: 100, height: 5)
        self.addSubview(line)
//        if self is UILabel {
//          
//         assert(false, "Before add label to superView , call layoutIfNeeded on your label")
//        }
        switch type {
        case BoderType.bottom:
            self.addConstraint( NSLayoutConstraint(item: line, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
            self.addConstraint( NSLayoutConstraint(item: line, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
            self.addConstraint( NSLayoutConstraint(item: line, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
            self.addConstraint( NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(width)))
            case BoderType.top:
            self.addConstraint( NSLayoutConstraint(item: line, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
            self.addConstraint( NSLayoutConstraint(item: line, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
             self.addConstraint( NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
            self.addConstraint( NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(width)))
            case BoderType.left:
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(width)))
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0))
            case BoderType.right:
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(width)))
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
                self.addConstraint( NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0))
        default:
            break
        }
        
        
        
    }


}
