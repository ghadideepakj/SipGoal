//
//  CustomTabBar.swift
//  Sip Goal
//
//  Created by Deepak Ghadi on 30/11/24.
//

import UIKit

import UIKit

class CustomTabBar: UITabBar {
    private var shapeLayer: CAShapeLayer?

    override func draw(_ rect: CGRect) {
        self.addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createWavePath().cgPath
        shapeLayer.fillColor = UIColor.systemBlue.cgColor

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }

    private func createWavePath() -> UIBezierPath {
        let path = UIBezierPath()
        let width = self.bounds.width
        let height: CGFloat = 50 // Height of the wave

        // Starting from the bottom left
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: -20))
        path.addLine(to: CGPoint(x: width, y: -20))
        path.addLine(to: CGPoint(x: width, y: 0))

        // Wavy top
        let curveWidth = width / 2
        let curveOffset = curveWidth / 4
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: width / 2 - curveOffset, y: -height),
                          controlPoint: CGPoint(x: width / 4, y: -height * 2))
        path.addQuadCurve(to: CGPoint(x: width / 2 + curveOffset, y: 0),
                          controlPoint: CGPoint(x: width / 2, y: 0 - height))
        path.addQuadCurve(to: CGPoint(x: width, y: 0),
                          controlPoint: CGPoint(x: width * 3 / 4, y: -height * 2))

        path.close()
        return path
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        self.items?.forEach { $0.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5) }
    }
}

