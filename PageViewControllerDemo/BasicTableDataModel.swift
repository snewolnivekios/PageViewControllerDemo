//
//  BasicTableDataModel.swift
//  PageViewControllerDemo
//
//  Copyright © 2017 Kevin L. Owens. All rights reserved.
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


/// Conforming types provide data needed to populate a table view with basic data.
protocol BasicTableDataModel {

  /// Returns the number of sections in the table.
  var numSections: Int { get }

  /// Returns the number of items or rows in the given `section` of the table.
  func numItems(forSection section: Int) -> Int

  /// Returns the `section` title, or `nil` if there is no section title.
  func title(forSection section: Int) -> String?

  /// Returns the text for the `item` in `section`, or `nil` if there is no text for that item.
  func text(forSection section: Int, item: Int) -> String?
}
