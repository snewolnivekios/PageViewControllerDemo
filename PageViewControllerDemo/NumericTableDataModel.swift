//
//  NumericTableDataModel.swift
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


/// An example `BasicTableDataModel` that, as a companion to `LatinTableDataModel`, provides a textual representation of the number of characters in each of that model's items.
struct NumericTableDataModel: BasicTableDataModel {

  /// Word forms of numeric values.
  let numberText = [ "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen" ]

  /// The model for which this model is providing character counts.
  let textModel = LatinTableDataModel()


  // MARK: - Basic Table Data Model

  /// The number of word groupings.
  var numSections: Int {
    return textModel.numSections
  }


  /// Returns the number of words in the requested `section`.
  func numItems(forSection section: Int) -> Int {
    return textModel.numItems(forSection: section)
  }


  /// Returns the title of the requested `section`.
  func title(forSection section: Int) -> String? {
    return textModel.title(forSection: section)
  }


  /// Returns a description of the number of characters in the `item`-indexed word within the requested `section` of `textModel`; e.g., "Three" or "Fifteen". If the item length exceeds 15 characters, returns `nil`.
  func text(forSection section: Int, item: Int) -> String? {
    if let itemLength = textModel.text(forSection: section, item: item)?.characters.count, itemLength <= numberText.count {
      return numberText[itemLength]
    }
    return nil
  }
}
