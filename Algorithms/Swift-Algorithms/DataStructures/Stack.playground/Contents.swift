import Foundation

struct Stack<Element> {
  
  private var storage: [Element]
  
  init() {}
  
  init(_ elements: [Element]) {
    storage = elements
  }
  
  mutating func push(_ element: Element) {
    storage.append(element)
  }
  
  @discardableResult
  mutating func pop() -> Element? {
    storage.popLast()
  }
  
  var peek: Element? {
    storage.last
  }
  
  var isEmpty: Bool {
    peek == nil
  }
  
  var count: Int { storage.count }
}

extension Stack: ExpressibleByArrayLiteral {
  
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}

extension Stack: CustomStringConvertible {
  
  var description: String {
    String(describing: storage)
  }
}

extension Stack: Equatable where Element: Equatable {}

extension Stack: Hashable where Element: Hashable {}

extension Stack: Encodable where Element: Encodable {}

extension Stack: Decodable where Element: Decodable {}

// MARK: - Example

var stackArray: Stack = [1, 2, 3, 4]
stackArray.push(6)
print(stackArray.description)

stackArray.pop()
stackArray.pop()

print(stackArray.description)

var stackArray1 = Stack(["1.0", "2", "3.0", "4"])

