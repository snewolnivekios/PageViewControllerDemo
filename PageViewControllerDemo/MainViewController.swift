//
//  MainViewController.swift
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


/// The app's main view controller that encapsulates the segmented control used to switch contexts between the controller's two embedded container viwes.
class MainViewController: UIViewController {

  /// Embeds the paged table view controller used for paginated presentation of its sectioned data.
  @IBOutlet weak var pagedContainerView: UIView!

  /// Embeds the non-paged table view controller used for scrolling presentation of its sectioned data.
  @IBOutlet weak var unpagedContainerView: UIView!


  /// Configures the visibility of the two container views in accordance with the initial segment control state.
  override func viewDidLoad() {
    super.viewDidLoad()
    unpagedContainerView.alpha = 0.0
  }


  /// Updates the visibility of the two container views in accordance with the new segment control state.
  @IBAction func changedViews(_ sender: UISegmentedControl) {

    func setViewAlphas(_ a: CGFloat, _ b: CGFloat) {
      UIView.animate(withDuration: 0.25) {
        self.pagedContainerView.alpha = a
        self.unpagedContainerView.alpha = b
      }
    }

    switch sender.selectedSegmentIndex {
    case 0:
      setViewAlphas(1.0, 0.0)
    case 1:
      setViewAlphas(0.0, 1.0)
    default:
      break
    }
  }


  /// Hands a tailored data model off to the embed-segue container views.
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    switch segue.destination {
    case let pvc as PageViewController:
      pvc.model = LatinTableDataModel()
    case let tvc as TableViewController:
      tvc.model = NumericTableDataModel()
    default:
      break
    }
  }
}

