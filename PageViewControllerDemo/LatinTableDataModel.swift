//
//  LatinTableDataModel.swift
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


/// An example `BasicTableDataModel` that provides "lorem ipsum" text.
struct LatinTableDataModel: BasicTableDataModel {

  /// A collection of textual elements composed of a variable number of words that follow an initial "title" word.
  let data = [
    "Nunc iaculis posuere viverra pretium lacus imperdiet",
    "Ut viverra arcu non dapibus fermentum nec massa eu nulla tempor ullamcorper eu quis massa",
    "Donec nec turpis euismod vehicula nunc congue lorem quisque augue",
    "Nam elit interdum vestibulum lectus sit amet mollis est maecenas mattis varius eros non sagittis nisi",
    "Quisque commodo purus varius posuere donec finibus nisi ligula bibendum sodales"
  ]


  // MARK: - Basic Table Data Model

  /// The number of word groupings.
  var numSections: Int {
    return data.count
  }


  /// Returns the number of words in the requested `section`.
  func numItems(forSection section: Int) -> Int {
    return data[section].characters.split(separator: " ").count - 1
  }


  /// Returns the title of the requested `section`.
  func title(forSection section: Int) -> String? {
    let index = data[section].characters.index(of: " ")!
    return String(data[section].characters.prefix(upTo: index))
  }


  /// Returns the `item`-indexed word within the requested `section`.
  func text(forSection section: Int, item: Int) -> String? {
    let items = data[section].characters.split(separator: " ").map(String.init)
    return String(items[item + 1])
  }
}
