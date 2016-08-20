//
//  ViewController.swift
//  Tipsy
//
//  Created by Diaconu Marius on 8/20/16.
//  Copyright © 2016 Diaconu Stefan. All rights reserved.
//

import UIKit

class TipsyVC: UIViewController {

    @IBOutlet weak var tipsyTitleView: UIView!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var tipTotal: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitAmount: UILabel!
    
    
    var tipsyVC = TipCalc(billAmount: 0.0, tipPercent: 0.0, splitNumber: 1)
    
    let step: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onBillAmountChanged(_ sender: AnyObject) {
        calcTip()
        updateLabels()
    }
    @IBAction func onTipValueChanged(_ sender: AnyObject) {
        let roundedValue = round(Double((tipSlider.value / step) * step))
        tipSlider.value = Float(roundedValue)
        tipPercentLabel.text = "Tip %\(Int(tipSlider.value))"
        tipsyVC.tipPercent = Double(tipSlider.value)
        calcTip()
        updateLabels()
    }
    @IBAction func onSplitValueChanged(_ sender: AnyObject) {
        splitLabel.text = "Split \(Int(splitSlider.value))"
        tipsyVC.splitNumber = Int(splitSlider.value)
        calcTip()
        updateLabels()
    }
    
    func calcTip()
    {
        tipsyVC.billAmount = ((billTextField.text)! as NSString).doubleValue
        tipsyVC.tipPercent = Double(tipSlider.value)
        tipsyVC.splitNumber = Int(splitSlider.value)
    }
    func updateLabels()
    {
        tipValue.text = "$\(String(format: "%.2f" ,tipsyVC.calculateTip()))"
        tipTotal.text = "$\(String(format: "%.2f", tipsyVC.calculateTotal()))"
        splitAmount.text = "$\(String(format: "%.2f",tipsyVC.calculateSplit()))"
    }

}

