import Foundation

/// `` Map``

extension Sequence {
  
  func tranformed<T>(_ converter: (Element) throws -> T) rethrows -> [T] {
    var result = [T]()
    result.reserveCapacity(underestimatedCount)
    
    for item in self {
      let tranformed = try converter(item)
      result.append(tranformed)
    }
    return result
  }
}

let numbers = [1, 2, 3].tranformed(Double.init)
let numbers1 = [1: "One", 2: "Two", 3: "Three"].tranformed { "\($0.key) = \($0.value)"}
//print(numbers, numbers1)


/// ``Filter``

extension Sequence where Element: Equatable {
  
  func includes(_ search: Element) -> Bool {
    for element in self where search == element {
      return true
    }
    return false
    
//    includes { $0 == search }
  }
}

extension Sequence {
  
  func includes(_ search: (Element) throws -> Bool) rethrows -> Bool {
    for element in self where try search(element) {
      return true
    }
    return false
  }
  
  func satisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    try !contains { try !predicate($0) }
  }
  
  func matching(_ predicate: (Element) throws -> Bool) rethrows -> [Element] {
    var matches = [Element]()
    
    for element in self where try predicate(element) {
      matches.append(element)
    }
    return matches
  }
}

//numbers.matching { $0 / 2 == 1 }.description

// MARK: - CompactMap

extension Sequence {
  
  func match<T>(_ predicate: (Element) throws -> T?) rethrows -> [T] {
    var matches = [T]()
    
    for element in self {
      if let value = try predicate(element) {
        matches.append(value)
      }
    }
    return matches
  }
}

//let optionalValues = [1, nil, 3, nil, 5]
//print(optionalValues.match { $0 })

