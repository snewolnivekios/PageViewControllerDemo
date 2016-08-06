//
//  DataModel.swift
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

/// A data source that provides tabulated textual data.
struct DataModel {

  /// A collection of textual elements composed of a variable number of words that follow an initial "title" word.
  let data = [
    "Nunc iaculis posuere viverra pretium lacus imperdiet",
    "Ut viverra arcu non dapibus fermentum nec massa eu nulla tempor ullamcorper eu quis massa",
    "Donec nec turpis euismod vehicula nunc congue lorem quisque augue",
    "Nam elit interdum vestibulum lectus sit amet mollis est maecenas mattis varius eros non sagittis nisi",
    "Quisque commodo purus varius posuere donec finibus nisi ligula bibendum sodales"
  ]

  /// The number of textual elements.
  var numElements: Int {
    return data.count
  }

  /// Returns the number of words in the requested textual `element`.
  func numItems(forElement element: Int) -> Int {
    return data[element].characters.split(separator: " ").count - 1
  }

  /// Returns the title of the requested textual `element`.
  func title(forElement element: Int) -> String {
    let index = data[element].characters.index(of: " ")!
    return String(data[element].characters.prefix(upTo: index))
  }

  /// Returns the `item`-indexed word within the requested element.
  func value(forElement element: Int, item: Int) -> String {
    let items = data[element].characters.split(separator: " ").map(String.init)
    return String(items[item + 1])
  }
}
