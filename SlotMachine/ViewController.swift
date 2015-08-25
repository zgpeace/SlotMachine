//
//  ViewController.swift
//  SlotMachine
//
//  Created by cbz on 8/24/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    @IBAction func buttonClicked(sender: AnyObject) {
        pickerView.selectRow(Int(arc4random_uniform(1000))%94 + 3, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random_uniform(1000))%94 + 3, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random_uniform(1000))%94 + 3, inComponent: 2, animated: true)
        
        if(dataArray1[pickerView.selectedRowInComponent(0)] == dataArray2[pickerView.selectedRowInComponent(1)] && dataArray1[pickerView.selectedRowInComponent(1)] == dataArray2[pickerView.selectedRowInComponent(2)]) {
            resultLabel.text = "Bingo!!"
        } else {
            resultLabel.text = ""
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageArray = ["🍎","😍","🐮","🐼","🐔","⛄️","🚘","❤️","🎂","👻"]
        
        for(var i = 0; i < 100; i++)
        {
            dataArray1.append((Int)(arc4random_uniform(100) % 10))
            dataArray2.append((Int)(arc4random_uniform(100) % 10))
            dataArray3.append((Int)(arc4random_uniform(100) % 10))
        }
        
        resultLabel.text = ""
//        pickerView.delegate = self
//        pickerView.dataSource = self

        
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        let pickerLabel = UILabel()
        
        if component == 0{
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
    }
    
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






























