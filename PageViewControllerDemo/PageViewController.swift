//
//  PageViewController.swift
//  PageViewControllerDemo
//
//  Copyright © 2016 Kevin L. Owens. All rights reserved.
//
//  PageViewControllerDemo is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  PageViewControllerDemo is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with PageViewControllerDemo.  If not, see <http://www.gnu.org/licenses/>.
//

import UIKit

/// The page view controller and data source that configures and manages the presentation of paginated view controllers.
class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

  /// The storyboard identifier for the view controller being paginated.
  let viewControllerIdentifier = "TableViewController"

  /// The number of pages being presented.
  let pageCount = DataModel().numElements


  /// Configures self as the data source, and installs the page indicator and first-presented view controller.
  override func viewDidLoad() {

    super.viewDidLoad()

    // Install this class as the data source
    dataSource = self

    // Install the first-presented view controller
    let tvc = storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifier) as! TableViewController
    tvc.section = 0
    setViewControllers([tvc], direction: .forward, animated: true, completion: nil)

    // Configure page indicator dot colors
    let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self])
    pageControl.pageIndicatorTintColor = .lightGray
    pageControl.currentPageIndicatorTintColor = .black
  }


  // MARK: - Page View Controller Data Source

  /// Returns the _next_ view controller, or `nil` if there is no such controller.
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

    let tvc = viewController as! TableViewController
    if tvc.section < pageCount - 1 {
      let newTVC = storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifier) as! TableViewController
      newTVC.section = tvc.section! + 1
      return newTVC
    }

    return nil
  }


  /// Returns the _previous_ view controller, or `nil` if there is no such controller.
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

    let tvc = viewController as! TableViewController
    if tvc.section > 0 {
      let newTVC = storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifier) as! TableViewController
      newTVC.section = tvc.section! - 1
      return newTVC
    }
    
    return nil
  }


  /// Returns the number of pages to represent in the `UIPageControl` page indicator.
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return pageCount
  }


  /// Returns the index of the currently visible view controller.
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    if let viewControllers = viewControllers, viewControllers.count > 0 {
      return (viewControllers[0] as! TableViewController).section!
    }
    return 0
  }
}
