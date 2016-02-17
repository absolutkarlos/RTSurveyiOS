//
//  formularioSlideViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import Foundation
import UIKit

class formularioSlideViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        self.view.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        
        let page1: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("companyN")
        let page2: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("contactN")
        let page3: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("siteN")
        let page4: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("buildingN")

        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "cambiarTituloNav:", name:"cambiarTituloNav", object: nil)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
    func cambiarTituloNav(notification: NSNotification){
        self.navigationItem.title = notification.object as? String
        print("Me han chamado tio")
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}