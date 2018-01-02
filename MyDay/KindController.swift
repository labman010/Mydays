//
//  KindController.swift
//  demo1
//
//  Created by kurisu on 2017/12/20.
//  Copyright © 2017年 Apple Inc. All rights reserved.
//

import UIKit

@IBDesignable class KindController: UIStackView {

    private var KindButtons = [UIButton]()
    
    var kind = -1 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
          setupButtons()
    }
    
    private func setupButtons() {
        
        for button in KindButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        KindButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
       
        let face0 = UIImage(named: "smile", in: bundle, compatibleWith: self.traitCollection)
        let face1 = UIImage(named: "cry", in: bundle, compatibleWith: self.traitCollection)
        let face2 = UIImage(named: "feelnothing", in: bundle, compatibleWith: self.traitCollection)
        let face3 = UIImage(named: "sweet", in: bundle, compatibleWith: self.traitCollection)
        let face4 = UIImage(named: "angry", in: bundle, compatibleWith: self.traitCollection)
        let downface = UIImage(named: "too-cry", in: bundle, compatibleWith: self.traitCollection)
        
        let too_face0 = UIImage(named: "too-smile", in: bundle, compatibleWith: self.traitCollection)
        let too_face1 = UIImage(named: "too-cry", in: bundle, compatibleWith: self.traitCollection)
        let too_face2 = UIImage(named: "too-feelnothing", in: bundle, compatibleWith: self.traitCollection)
        let too_face3 = UIImage(named: "too-sweet", in: bundle, compatibleWith: self.traitCollection)
        let too_face4 = UIImage(named: "too-angry", in: bundle, compatibleWith: self.traitCollection)
        
        var x=0
        for _ in 0..<5{
            
            let button = UIButton()
            switch x
            {
            case 0: button.setImage(face0 , for: .normal)
            case 1: button.setImage(face1 , for: .normal)
            case 2: button.setImage(face2 , for: .normal)
            case 3: button.setImage(face3 , for: .normal)
            case 4: button.setImage(face4 , for: .normal)
                
            default:
                print("error!")
            }
          
            switch x
            {
            case 0: button.setImage(too_face0, for: .selected)
            case 1: button.setImage(too_face1 , for: .selected)
            case 2: button.setImage(too_face2 , for: .selected)
            case 3: button.setImage(too_face3 , for: .selected)
            case 4: button.setImage(too_face4 , for: .selected)

            default:
                print("error!")
            }
            
     //       button.setImage(downface, for: .highlighted)
       //     button.setImage(downface, for: [.highlighted, .selected])
        //  button.backgroundColor = UIColor.brown
        
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        
            button.addTarget(self, action: #selector(KindController.KindButtonTapped(button:)), for: .touchUpInside)
      
            addArrangedSubview(button)
            KindButtons.append(button)
         
            x=x+1
        }
        updateButtonSelectionStates()
    }
    
    //action
    func KindButtonTapped(button: UIButton) {
        guard let index = KindButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the kindButtons array: \(KindButtons)")
        }
        switch index {
        case 0:
            print("0 pressed ");kind=0
        case 1:
            print("1 pressed ");kind=1
        case 2:
            print("2 pressed ");kind=2
        case 3:
            print("3 pressed ");kind=3
        case 4:
            print("4 pressed ");kind=4
        default:
            print(" face error ");
        }
    }
    private func updateButtonSelectionStates() {
        for (index, button) in KindButtons.enumerated()
        {
            button.isSelected=index==kind
        }
        
    }
}
