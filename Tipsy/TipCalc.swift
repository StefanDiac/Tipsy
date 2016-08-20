//
//  TipCalc.swift
//  Tipsy
//
//  Created by Diaconu Marius on 8/20/16.
//  Copyright © 2016 Diaconu Stefan. All rights reserved.
//

import Foundation

class TipCalc {
    
    private var _billAmount: Double = 0.0
    private var _tipPercent: Double = 0.0
    private var _tipAmount: Double = 0.0
    private var _totalAmount: Double = 0.0
    private var _splitNumber: Int = 1
    private var _splitAmount: Double = 0.0
    
    var billAmount: Double
        {
        get {
            return _billAmount
        }
        set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double
        {
        get{
            return _tipPercent
        }
        set{
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double
        {
            return _tipAmount
    }
    
    var totalAmount: Double
        {
        return _totalAmount
    }
    
    var splitNumber: Int
    {
        get{
            return _splitNumber
        }
        set{
            _splitNumber = newValue
        }
    }
    
    var splitAmount: Double
    {
        return _splitAmount
    }
    
    init(billAmount: Double, tipPercent: Double, splitNumber: Int)
    {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._splitNumber = splitNumber
    }
    
    func calculateTip() -> Double {
        return (_tipPercent / 100) * _billAmount
    }
    
    func calculateTotal() -> Double
    {
        return calculateTip() + _billAmount
    }
    
    func calculateSplit() -> Double
    {
        return calculateTip() / Double(splitNumber)
    }
}
