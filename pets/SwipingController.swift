//
//  SwipingController.swift
//  pets
//
//  Created by Vanessa Tavares Tavernari on 08/04/2022.
//

import UIKit

class SwipingController: UIViewController{
    var myCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view  = UIView()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
    
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = UIColor.white
        myCollectionView?.isPagingEnabled = true
        
        
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.view = view
    }
}

extension SwipingController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        //myCell.backgroundColor = UIColor.purple
        myCell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

extension SwipingController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("user tapped on item \(indexPath.row + 1)")
    }
    
    
}

//    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let collectionView = UICollectionView()
//
//        collectionView.backgroundColor = .green
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
//        collectionView.isPagingEnabled = true
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        self.view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: 100, height: 100)
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        view.addSubview(collectionView)
//
//        let safeArea = self.view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo:safeArea.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo:safeArea.bottomAnchor),
//            collectionView.rightAnchor.constraint(equalTo:safeArea.rightAnchor),
//            collectionView.leftAnchor.constraint(equalTo:safeArea.leftAnchor),
//        ])
//
//
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 4
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//        cell.backgroundColor = .red
//        return cell
//    }
//}
//
//// MARK: Data Source
//
////extension SwipingController: UICollectionViewDataSource, UICollectionViewDelegate {
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 0
////    }
////
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return 4
////    }
////
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
////        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
////        cell.backgroundColor = .purple
////        return cell
////    }
////
////
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            return CGSize(width: 100, height: 100)
//
//        }
//
