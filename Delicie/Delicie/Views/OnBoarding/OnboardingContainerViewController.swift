//
//  OnboardingViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 6.12.2023.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
    
    private let pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        return pageVC
    }()
    
    private var pages = [UIViewController]()
    
    private var currentVC: UIViewController
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: [])
        button.backgroundColor?.setFill()
        button.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        
        return button
    }()
    
    private var indexTurn: Int = 0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        
        let page1 = OnboardingViewController(imageName: "slide1", titleText: "Quick Delivery At Your Doorstep", secondTitleText: "Home delivery and Online rezervation system for restaurants and cafes")
        let page2 = OnboardingViewController(imageName: "slide2", titleText: "World-Class Chefs", secondTitleText: "Our dishes are prepared by the best")
        let page3 = OnboardingViewController(imageName: "slide3", titleText: "Delicious Dishes", secondTitleText: "Experince a variety of amazing dishes from different cultures around the world")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first ?? page1
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

        layout()
    }
    
    private func setup(){
        view.backgroundColor = .red
        
        // It is how to add child VC to ParentVC, 3 steps
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        view.addSubview(nextButton)
        
        // Protocol-Delegate Pattern
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        //currentVC = pages.first!
        
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor, constant: 100),
        ])
        //nextButton
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
}

extension OnboardingContainerViewController{
    
    @objc func nextTapped(){
       
        if indexTurn < 1{
            currentVC = pages[indexTurn+1]
        } else {
            print("end of the road")
        }
    }
}
// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        indexTurn = index
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}
