//
//  UIViewControllerExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/15/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension UIViewController {

}

extension UINavigationController {
    func setBackgroundImage(_ image: UIImage) {
        navigationBar.isTranslucent = true
        navigationBar.barStyle = .blackTranslucent
        
        let logoImageView = UIImageView(image: image)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(logoImageView, belowSubview: navigationBar)
        NSLayoutConstraint.activate([
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor)
            ])
    }
    
    func popViewControllerWithHandler(completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
    func pushViewController(viewController: UIViewController, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
}
