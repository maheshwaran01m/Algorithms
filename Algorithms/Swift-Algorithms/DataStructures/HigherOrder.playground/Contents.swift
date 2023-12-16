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
print(numbers, numbers1)

