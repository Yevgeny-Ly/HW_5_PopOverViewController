//
//  ViewController.swift
//  HW #5 PopOverViewController
//
//  Created by Евгений Л on 15.07.2023.
//

import UIKit

class InitialViewController: UIViewController {

    let buttonView = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        buttonNamePresent()
    }
    
    func buttonNamePresent() {
        buttonView.setTitle("Present", for: .normal)
        buttonView.addTarget(self, action: #selector(didTapButtonController), for: .touchUpInside)
        
        addButtonConstraint()
    }
    
    func addButtonConstraint() {
        [buttonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc
    func didTapButtonController() {
        let popOverViewController = PopOverViewController()
        popOverViewController.modalPresentationStyle = .popover
        popOverViewController.preferredContentSize = .init(width: 300, height: 280)
        
        guard let presentationVC = popOverViewController.popoverPresentationController else { return }
        presentationVC.delegate = self
        presentationVC.sourceView = buttonView
        presentationVC.permittedArrowDirections = .up
        presentationVC.sourceRect = CGRect(x: Int(buttonView.bounds.midX),
                                           y: Int(buttonView.bounds.maxY),
                                           width: 0,
                                           height: 0)
        present(popOverViewController, animated: true)
    }
}

extension InitialViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        false
    }
}

