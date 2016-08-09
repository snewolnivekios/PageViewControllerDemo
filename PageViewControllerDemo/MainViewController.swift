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
    unpagedContainerView.isHidden = true
  }


  /// Updates the visibility of the two container views in accordance with the new segment control state.
  @IBAction func changedViews(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      pagedContainerView.isHidden = false
      unpagedContainerView.isHidden = true
    case 1:
      pagedContainerView.isHidden = true
      unpagedContainerView.isHidden = false
    default:
      break
    }
  }


  /// Hands a tailored data model off to the embed-segue container views.
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    switch segue.destination {
    case let pvc as PageViewController:
      pvc.model = TabularDataModel()
    case let tvc as TableViewController:
      tvc.model = TabularDataModel()
    default:
      break
    }
  }
}

