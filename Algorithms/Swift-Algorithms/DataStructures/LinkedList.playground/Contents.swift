import UIKit

class LinkedListNode<Element> {
  
  var value: Element
  var next: LinkedListNode?
  
  init(_ value: Element, next: LinkedListNode? = nil) {
    self.value = value
    self.next = next
  }
}

class LinkedList<Element>: ExpressibleByArrayLiteral {
  var start: LinkedListNode<Element>?
  
  required init(arrayLiteral elements: Element...) {
    for element in elements.reversed() {
      start = LinkedListNode(element, next: start)
    }
  }
  
  init(_ elements: Element...) {
    for element in elements.reversed() {
      start = LinkedListNode(element, next: start)
    }
  }
}

extension LinkedList: Sequence {
  
  func makeIterator() -> LinkedListIterator<Element> {
    LinkedListIterator(current: start)
  }
}

// MARK: - LinkedListIterator

struct LinkedListIterator<Element>: IteratorProtocol {
  var current: LinkedListNode<Element>?
  
  mutating func next() -> LinkedListNode<Element>? {
    defer { current = current?.next }
    return current
  }
}

// MARK: - Example

/*
let third = LinkedListNode(5)
let second = LinkedListNode(4, next: third)
let first = LinkedListNode(3, next: second)

let list = LinkedList<Int>()
list.start = first

var currentNode = list.start

while let node = currentNode {
  print(node.value, terminator: " ")
  currentNode = node.next
}
 */

let list1 = LinkedList(Array(1...200_000))
var start = CFAbsoluteTimeGetCurrent()

while let start = list1.start {
  list1.start = start.next
}

var end = CFAbsoluteTimeGetCurrent()

print("Took \(end - start) seconds to get 0")
