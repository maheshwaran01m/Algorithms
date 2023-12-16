import Foundation

final class Node<Value> {
  var value: Value
  
  private(set) var children: [Node]
  
  init(_ value: Value) {
    self.value = value
    self.children = []
  }
  
  init(_ value: Value, children: [Node]) {
    self.value = value
    self.children = children
  }
  
  var count: Int {
    var value = 1 + children.count
    
   return 1 + children.reduce(0) { $0 + $1.count }
  }
  
  func add(_ child: Node) {
    children.append(child)
  }
}

extension Node: Equatable where Value: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    lhs.value == rhs.value
  }
}
extension Node: Hashable where Value: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(children)
  }
}
extension Node: Codable where Value: Codable {}

extension Node: CustomStringConvertible {
  var description: String {
    String(describing: value) + " " + String(describing: children)
  }
}

extension Node where Value: Equatable {
  
  func find(_ value: Value) -> Node? {
    if self.value == value { return self }
    
    for child in children {
      if let match = child.find(value) {
        return match
      }
    }
    return nil
  }
}

// MARK: - Result Builders

@resultBuilder
struct NodeBuilder {
  
  static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
    children
  }
}

extension Node {
  
  convenience init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
    self.init(value, children: builder())
  }
}

var values = Node("B")
values.add(.init("C"))

var root = Node("A")
root.add(values)

print(root.find("B") ?? "")
