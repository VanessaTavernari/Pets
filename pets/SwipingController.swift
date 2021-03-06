//
//  SwipingController.swift
//  pets
//
//  Created by Vanessa Tavares Tavernari on 08/04/2022.
//

import UIKit

class SwipingController: UIViewController{
    var myCollectionView: UICollectionView?
    
    let pages = [
        Page(imageName: "dog", headerText: "Dog", bodyText: "Along with their noses, their hearing is super sensitive.\n\n\nTheir sense of smell is at least 40x better than ours"),
        Page(imageName: "duck", headerText: "Duck", bodyText: "Ducks are so cute."),
        Page(imageName: "cow", headerText: "Cow", bodyText: "Cows are very sensitive.\n\n\nCows are so cute."),
        Page(imageName: "giraffe", headerText: "Giraffe", bodyText: "Giraffes are observers.")
    ]
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc  func handlePrev() {
        print("Trying to advance to next")
        
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        myCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc  func handleNext() {
        print("Trying to advance to next")
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        myCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
            pageControl.currentPage = Int(x / view.frame.width)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let view  = UIView()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
    
        myCollectionView?.register(PageCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = UIColor.white
        myCollectionView?.isPagingEnabled = true
        
        
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.view = view
        
        setupBottomControls()
    }
}

extension SwipingController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        myCell.page = page
        
        
        
//        myCell.imageView.image = UIImage(named: page.imageName)
//        myCell.descriptionTextView.text = page.headerText
        
//        let imageName = imageNames[indexPath.item]
//        myCell.imageView.image = UIImage(named: imageName)
//        myCell.descriptionTextView.text = headerStrings[indexPath.item]
        
        //myCell.backgroundColor = UIColor.purple
//        myCell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
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

