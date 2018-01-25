//
//  ViewController.swift
//  TextViewResize
//
//  Created by James Rochabrun on 1/24/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.

import UIKit

class ViewController: UIViewController {

    lazy var resizableTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.lightGray
        tv.delegate = self
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        tv.isScrollEnabled = false
        tv.text = "Default text just sto show \n again"
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(resizableTextView)
        NSLayoutConstraint.activate([
            resizableTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resizableTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            resizableTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            resizableTextView.heightAnchor.constraint(equalToConstant: 50)
            ])
        /// calling the delegate
        textViewDidChange(resizableTextView)
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let estimatedSize = textView.sizeThatFits(CGSize(width: view.frame.width, height: .infinity))
        textView.constraints.forEach {
            if $0.firstAttribute == .height {
                $0.constant = estimatedSize.height
            }
        }
    }
}




























