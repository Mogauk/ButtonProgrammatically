//
//  ViewController.swift
//  ButtonProgrammatically
//
//  Created by Alexey on 4/19/22.
//

import UIKit



class ViewController: UIViewController {
    
    //This dictionary gives us a color name for a key and a for a value.
    //MARK: - Properties
    let colorDictionary = ["Red": UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), "Green": UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), "Blue": UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayButton()
        
    }
    
    //MARK: - Instance methods
    func colorButton(withColor color: UIColor, title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = color
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.layer.cornerRadius = 10
        return newButton
    }
    
    func displayButton() {
        //generate an array of buttons
        var buttonArray = [UIButton]()
        for (myKey, myValue) in colorDictionary {
            buttonArray += [colorButton(withColor: myValue, title: myKey)]
        }
        /*
        let stackView = UIStackView(arrangedSubviews: buttonArray)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        */
        
        // set up the stack view
        let subStackView = UIStackView(arrangedSubviews: buttonArray)
        subStackView.axis = .horizontal
        subStackView.alignment = .fill
        subStackView.distribution = .fillEqually
        subStackView.spacing = 5
        
        //set up a label
        let label = UILabel()
        label.text = "Color Chooser"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        
        let blackButton = colorButton(withColor: .black, title: "Black")
        
        let stackView = UIStackView(arrangedSubviews: [label, subStackView, blackButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        //    autolayout the stack view - pin 40 up 20 left 20 right 30 down
      
        let viewsDictionary = ["stackView": stackView]
        let stackViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackView]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let stackViewVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[stackView]-30-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        view.addConstraints(stackViewHorizontal)
        view.addConstraints(stackViewVertical)
        
    }
    
    
    
}





