//
//  GraphViewController.swift
//  Calculator
//
//  Created by Student on 30/12/15.
//  Copyright © 2015 HHS. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController
{
    var brain = CalculatorBrain?()
    
    @IBOutlet var graphView: GraphView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        graphView.drawer.brain = brain
    }
}
