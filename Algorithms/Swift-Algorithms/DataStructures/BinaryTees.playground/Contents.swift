import Foundation

/// ``Binary Tree``

/*
 InOrder -> Left Parent Right
 PreOrder -> Parent left right
 PostOrder -> Left right Parent
 */


class Node<Value> {
  var value: Value
  private(set) var left: Node?
  private(set) var right: Node?
  var count = 1
  
  init(_ value: Value) {
    self.value = value
  }
}

extension Array {
  
  init<T>(_ node: Node<T>) where Element == Node<T> {
    self = [Node<T>]()
    
    if let left = node.left {
      self += Array(left)
    }
    
    self += [node]
    
    if let right = node.right {
      self += Array(right)
    }
  }
}

// MARK: - Iterator

struct NodeIterator<Value>: IteratorProtocol {
  var items: [Node<Value>]
  var position = 0
  
  mutating func next() -> Node<Value>? {
    if position < items.count {
      defer { position += 1 }
      return items[position]
    } else {
      return nil
    }
  }
}

extension Node: Sequence {
  
  /*
  func makeIterator() -> Array<Node<Value>>.Iterator {
    Array(self).makeIterator()
  }
   
  
  func makeIterator() -> AnyIterator<Node<Value>> {
    AnyIterator(Array(self).makeIterator())
  }
  */
  
  func makeIterator() -> NodeIterator<Value> {
    NodeIterator(items: Array(self))
  }
}

// MARK: - Find

extension Node where Value: Equatable {
  
  func find(_ search: Value) -> Node? {
    for node in self where node.value == search {
      return node
    }
    return nil
  }
}

// MARK: - Comparable

extension Node where Value: Comparable {
  
  func insert(_ newValue: Value) {
    if newValue < value {
      if left == nil { 
        left = Node(newValue)
      } else {
        left?.insert(newValue)
      }
    } else if newValue > value {
      if right == nil {
        right = Node(newValue)
      } else {
        right?.insert(newValue)
      }
    } else {
      count += 1
    }
  }
}

// MARK: - Find

extension Node where Value: Comparable {
  
  func fastFind(_ search: Value) -> Node? {
    if value == search { return self }
    
    if search < value {
      return left?.fastFind(search)
    } else {
      return right?.fastFind(search)
    }
  }
}


// MARK: - Example

/*
let root = Node(1)
root.left = Node(5)
root.right = Node(3)

root.left?.left = Node(7)
root.left?.right = Node(3)

root.right?.left = Node(6)
root.right?.right = Node(4)

for node in Array(root) {
  print(node.value)
}

print(root.find(5)?.value)
*/

let binaryTree = Node(500_000)

for _ in 1...1_000_000 {
  binaryTree.insert(Int.random(in: 1...1_000_000))
}

var start = CFAbsoluteTimeGetCurrent()
let results1 = binaryTree.find(1)
var end = CFAbsoluteTimeGetCurrent()
print("Took \(String(format: "%f", end - start)) seconds to find: \(results1?.value ?? -1)")

start = CFAbsoluteTimeGetCurrent()
let results2 = binaryTree.fastFind(2)
end = CFAbsoluteTimeGetCurrent()
print("Took \(String(format: "%f", end - start)) seconds to find: \(results1?.value ?? -1)")
