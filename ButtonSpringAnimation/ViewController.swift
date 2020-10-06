//
//  ViewController.swift
//  ButtonSpringAnimation
//
//  Created by Hiroyuki Miura on 2020/10/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.layer.cornerRadius = 60 / 2
        button.layer.cornerCurve = .continuous
        button.backgroundColor = UIColor.blue
        button.setTitle("押してみ", for: .normal)
        
        let constraints = [
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
        button.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender:UIButton) {
        animateView(sender)
    }
    
    func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }) { (_) in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                viewToAnimate.transform = .identity
                
            }, completion: nil)
        }
    }


}

