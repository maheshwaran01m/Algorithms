import Foundation

/// ``Ordered Sets``

struct OrderedSet<Element: Hashable> {
  
  public private(set) var storage = [Element]()
  private var set = Set<Element>()
  
  var count: Int { storage.count }
  
  var isEmpty: Bool { storage.isEmpty }
  
  init() {}
  
  init(_ elements: [Element]) {
    for element in elements {
      append(element)
    }
  }
  
  @discardableResult
  mutating func append(_ element: Element) -> Bool {
    if set.insert(element).inserted /* .memberAfterInsert */ {
      storage.append(element)
      return true
    } else {
      return false
    }
  }
  
  func contains(_ member: Element) -> Bool {
    set.contains(member)
  }
  
  static func ==(lhs: OrderedSet, rhs: OrderedSet) -> Bool {
    lhs.storage == rhs.storage
  }
}

extension OrderedSet: RandomAccessCollection {
  
  var startIndex: Int { storage.startIndex }
  var endIndex: Int { storage.endIndex }
  
  subscript(index: Int) -> Element {
    storage[index]
  }
}

// MARK: - Example

let sets = OrderedSet([5, 10, 15, 20, 15, 10, 5])
print(sets.storage)
