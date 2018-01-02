//
//  UIstyleViewController.swift
//  demo1
//
//  Created by kurisu on 2018/1/1.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import UIKit

class UIstyleViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
   

    
    @IBOutlet weak var singlepicker: UIPickerView!
    
    
    private let colors = ["green","pink","blue","gray","black"]

  
    @IBAction func bottonpressed(_ sender: UIButton) {
        let row=singlepicker.selectedRow(inComponent: 0)
        let selected = colors[row]
        let title = "You selected \(selected)"
        
        switch selected{
        case"green":
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 253.0/255.0, blue: 210.0/255.0, alpha: 1.0)
           UINavigationBar.appearance().barTintColor = UIColor(red: 180.0/255.0, green: 253.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        case "pink":self.navigationController?.navigationBar.barTintColor = UIColor(red: 250.0/255.0, green: 124.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            UINavigationBar.appearance().barTintColor = UIColor(red: 250.0/255.0, green: 124.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            case "gray":
                self.navigationController?.navigationBar.barTintColor = .gray
            UINavigationBar.appearance().barTintColor = .gray
            case "black":
                self.navigationController?.navigationBar.barTintColor = .black
            UINavigationBar.appearance().barTintColor = .black
            case "blue":
               self.navigationController?.navigationBar.barTintColor = UIColor(red: 36.0/255.0, green: 190.0/255.0, blue: 236.0/255.0, alpha: 1.0)
               UINavigationBar.appearance().barTintColor = UIColor(red: 36.0/255.0, green: 190.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        default:
            print("pp")
        }
 
        let alert = UIAlertController(title:title,message: "OK",preferredStyle:.alert)
        let action = UIAlertAction(title: "OK",style:.default,handler:nil)
        alert.addAction(action)
        present(alert,animated: true, completion:nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.tintColor = .white

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
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
