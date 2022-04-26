//
//  ViewController.swift
//  lbta-shimmer
//
//  Created by Maxim Tsyganov on 26.04.2022.
//

import UIKit

class ViewController: UIViewController {

    let darkTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Shimmer"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(white: 1, alpha: 0.05)
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }()

    let shinyTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Shimmer"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        setupLayout()

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]

        gradientLayer.frame = view.frame
//        useful comment for understanding fact that frame can be any
//        gradientLayer.frame = shinyTextLabel.frame

        gradientLayer.transform = CATransform3DMakeRotation(.pi / 2, 0, 0, 1)

//        useful comment for debugging
//        view.layer.addSublayer(gradientLayer)
        shinyTextLabel.layer.mask = gradientLayer


        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -2 * view.frame.width
        animation.toValue = 2 * view.frame.width
        animation.repeatCount = Float.infinity
        animation.duration = 2.8

        gradientLayer.add(animation, forKey: "doesnt matter just some key")
    }

    private func setupLayout() {
        [darkTextLabel, shinyTextLabel].forEach { view.addSubview($0) }

        NSLayoutConstraint.activate([
            darkTextLabel.topAnchor.constraint(equalTo: view.topAnchor),
            darkTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            darkTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        NSLayoutConstraint.activate([
            shinyTextLabel.centerXAnchor.constraint(equalTo: darkTextLabel.centerXAnchor),
            shinyTextLabel.centerYAnchor.constraint(equalTo: darkTextLabel.centerYAnchor),
            shinyTextLabel.topAnchor.constraint(equalTo: darkTextLabel.topAnchor),
            shinyTextLabel.leadingAnchor.constraint(equalTo: darkTextLabel.leadingAnchor),
        ])

    }

}

