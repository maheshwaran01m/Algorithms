import Foundation

/// ``Sorted Arrays``

struct SortedArray<Element> {
  
  private var storage = [Element]()
  
  private var sortBefore: (Element, Element) -> Bool
  
  var count: Int { storage.count }
  
  init(_ comparator: @escaping (Element, Element) -> Bool) {
    sortBefore = comparator
  }
  
  mutating func insert(_ element: Element) {
    for (index, item) in storage.enumerated() where sortBefore(element, item) {
      storage.insert(element, at: index)
      return
    }
    storage.append(element)
  }
  
  mutating func remove(at index: Int) {
    storage.remove(at: index)
  }
}

extension SortedArray: CustomStringConvertible {
  
  var description: String {
    storage.description
  }
}

// MARK: - RandomAccessCollection

extension SortedArray: RandomAccessCollection {
  
  var startIndex: Int { storage.startIndex }
  var endIndex: Int { storage.endIndex }
  
  subscript(index: Int) -> Element {
    storage[index]
  }
}

// MARK: - Comparable

extension SortedArray where Element: Comparable {
  init() {
    self.init(<)
  }
}

// MARK: - Min

extension SortedArray {
  
  @warn_unqualified_access func min() -> Element? {
    storage.isEmpty ? nil : storage[0]
  }
  
  @warn_unqualified_access func max() -> Element? {
    storage.isEmpty ? nil : storage[storage.count-1]
  }
  
  func minAndMax() -> (Element?, Element?) {
    (self.min(), self.max())
  }
}

// MARK: - Example

var items = SortedArray<Int>()
items.insert(5)
items.insert(3)
items.insert(4)
items.insert(8)

print(items.max() ?? -1)

