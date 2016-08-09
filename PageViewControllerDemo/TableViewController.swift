//
//  TableViewController.swift
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

/// A table view controller that presents sections of tabulated data for both paginated and non-paginated views, as determined by the value of `section`.
class TableViewController: UITableViewController, TabularDataModelContainer {

  /// If non-nil, the controller presents data only for the assigned section; if nil, the controller presents all sectioned data in a single view.
  var section: Int?

  /// The source of the tabular data.
  var model: TabularDataModel {
    get { return _model }
    set { _model = newValue }
  }
  private var _model: TabularDataModel!


  // MARK: - Table View Data Source

  /// Returns the number of sections in the table.
  override func numberOfSections(in tableView: UITableView) -> Int {
    return section == nil ? _model.numElements : 1
  }


  /// Returns the number of rows in the requested table `section`.
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let group = self.section ?? section
    return _model.numItems(forElement: group)
  }


  /// Returns the title for the requested table `section`.
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let group = self.section ?? section
    return _model.title(forElement: group)
  }


  /// Returns a cell for the requested `indexPath` populated with the corresponding data.
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = self.section ?? indexPath.section
    let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell") as! BasicCell
    cell.titleLabel.text = _model.value(forElement: section, item: indexPath.row)
    return cell
  }
}

// MARK: -

/// The basic prototype table view cell that provides only a single label for textual presentation.
class BasicCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
}
