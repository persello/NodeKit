//
//  File.swift
//  File
//
//  Created by Riccardo Persello on 02/08/21.
//

import UIKit

@IBDesignable
class NKGrid: UIView {
    
    @IBInspectable var gridSpacing: CGFloat = 20 {
        didSet {
            grid(spacing: gridSpacing)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        grid(spacing: gridSpacing)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        grid(spacing: gridSpacing)
    }
    
    func grid(spacing: CGFloat) {
        let gridLayer = CAShapeLayer()
        let gridPath = UIBezierPath()
        
        let rows: Int = Int(ceil(frame.height / spacing))
        let cols: Int = Int(ceil(frame.width / spacing))
        
        for i in 0...cols {
            let x = CGFloat(i) * spacing
            gridPath.move(to: CGPoint(x: x, y: 0))
            gridPath.addLine(to: CGPoint(x: x, y: frame.height))
        }
        
        for i in 0...rows {
            let y = CGFloat(i) * spacing
            gridPath.move(to: CGPoint(x: 0, y: y))
            gridPath.addLine(to: CGPoint(x: frame.width, y: y))
        }
        
        // TODO: Let users customize properties
        gridLayer.strokeColor = UIColor.systemGray.cgColor
        gridLayer.lineWidth = 4
        
        gridLayer.path = gridPath.cgPath
        
        layer.addSublayer(gridLayer)
    }
}
