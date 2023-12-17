import Foundation

// MARK: - Map

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


// MARK: - Filter

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
  
  func matching(_ predicate: (Element) throws -> Bool) rethrows -> [Element] {
    var matches = [Element]()
    
    for element in self where try predicate(element) {
      matches.append(element)
    }
    return matches
  }
}

// MARK: - Contains

extension Sequence {
  
  func satisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    try !contains { try !predicate($0) }
  }
  
  func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
    for e in self where try predicate(e) {
      return true
    }
    return false
  }
  
  func min(
    by areInIncreasingOrder: (Element, Element) throws -> Bool
  ) rethrows -> Element? {
    var it = makeIterator()
    guard var result = it.next() else { return nil }
    while let e = it.next() {
      if try areInIncreasingOrder(e, result) { result = e }
    }
    return result
  }
  
  func max(
    by areInIncreasingOrder: (Element, Element) throws -> Bool
  ) rethrows -> Element? {
    var it = makeIterator()
    guard var result = it.next() else { return nil }
    while let e = it.next() {
      if try areInIncreasingOrder(result, e) { result = e }
    }
    return result
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


// MARK: - Reduce

extension Sequence {
  
  func total<Result>(
    _ initialResult: Result,
    _ nextPartialResult:
      (_ partialResult: Result, Element) throws -> Result
  ) rethrows -> Result {
    
    var accumulator = initialResult
    for element in self {
      accumulator = try nextPartialResult(accumulator, element)
    }
    return accumulator
  }
}

// MARK: - Reversed

extension Sequence {
  
  func inverted() -> [Element] {
    var result = Array(self)
    let count = result.count
    for i in 0..<count/2 {
      result.swapAt(i, count - ((i + 1) as Int))
    }
    return result
  }
}
