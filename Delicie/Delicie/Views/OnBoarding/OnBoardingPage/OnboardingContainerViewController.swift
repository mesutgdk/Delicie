//
//  OnboardingViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 6.12.2023.
//

import UIKit

final class OnboardingContainerViewController: UIViewController {
    
    private let pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        return pageVC
    }()
    
    private var pages = [UIViewController]()
    
    private var currentVC: UIViewController
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip", for: [])
        button.backgroundColor = .systemGray5
        button.tintColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        
//        button.addTarget(self, action: #selector(skipTapped), for: .primaryActionTriggered)
        return button
    }()
        
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
        view.backgroundColor = .systemRed
        
        // It is how to add child VC to ParentVC, 3 steps
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        view.addSubview(skipButton)
        
        // Protocol-Delegate Pattern
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        
        createNextButtonAction()
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
            skipButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            skipButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            skipButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
}
// MARK: - Actions
extension OnboardingContainerViewController{
    private func createNextButtonAction(){
        let action = UIAction{[weak self] _ in
            self?.skipTapped()
        }
        skipButton.addAction(action, for: .touchUpInside)

    }
    private func skipTapped(){
       
        print("end of the road")
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
        
        currentVC = pages[index + 1]
        if index+2 == pages.count {
            skipButton.setTitle("Close", for: [])
        }
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}
