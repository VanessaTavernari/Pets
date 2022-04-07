//
//  ViewController.swift
//  pets
//
//  Created by Vanessa Tavares Tavernari on 06/04/2022.
//

import UIKit

class ViewController: UIViewController {

    //let´s avoid polluting viewDidLoad
    let image: UIImage = UIImage(named: "dog")!
    let imageView: UIImageView = UIImageView()
   
  
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        
        let attributedText = NSMutableAttributedString(string: "Dog", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAlong with their noses, their hearing is super sensitive", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nTheir sense of smell is at least 40x better than ours", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))

        textView.attributedText = attributedText


//        textView.text = "Their sense of smell is at least 40x better than ours"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        //view.addSubview(imageView)
        view.addSubview(descriptionTextView)
        setupLayout()
        
    }
    
    func setupLayout() {
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor = .blue
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(imageView)
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }


}

