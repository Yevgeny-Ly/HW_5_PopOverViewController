//
//  PopOverViewController.swift
//  HW #5 PopOverViewController
//
//  Created by Евгений Л on 15.07.2023.
//

import UIKit

class PopOverViewController: UIViewController {
    
    let closedButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        buttonClosed()
        createSuitSegmentControll()
    }
    
    func buttonClosed() {
        closedButton.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        closedButton.tintColor = .gray
        closedButton.translatesAutoresizingMaskIntoConstraints = false
        closedButton.addTarget(self, action: #selector(disclosurePopOver), for: .touchUpInside)
        view.addSubview(closedButton)
        
        NSLayoutConstraint.activate([
            closedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250),
            closedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closedButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ])
    }
    
    func createSuitSegmentControll() {
        let items = ["280pt", "150pt"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.setEnabled(true, forSegmentAt: 0)
        segmentedControl.addTarget(self, action: #selector(selectorDimensionalChanges(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ])
    }
    
    @objc
    func disclosurePopOver() {
        dismiss(animated: true)
    }
    
    @objc
    func selectorDimensionalChanges(_ segmentedControl : UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            preferredContentSize = CGSize(width: 300, height: 280)
        case 1:
            preferredContentSize = CGSize(width: 300, height: 150)
        default:
            preferredContentSize = CGSize(width: 300, height: 280)
        }
    }
}

