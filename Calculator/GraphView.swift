//
//  GraphView.swift
//  Calculator
//
//  Created by Student on 30/12/15.
//  Copyright © 2015 HHS. All rights reserved.
//

import UIKit

class GraphView: UIView
{
    var drawer = AxesDrawer()
    
    override func drawRect(rect: CGRect)
    {
        super.drawRect(rect)
        drawer.contentScaleFactor = self.contentScaleFactor
        drawer.drawAxesInRect(self.bounds, origin: self.center, pointsPerUnit: 50)
    }
}
