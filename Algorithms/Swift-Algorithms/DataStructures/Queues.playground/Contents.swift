import UIKit

struct Queue<Element> {
  
  private var storage = [Element]()
  
  var first: Element? { storage[0] }
  var last: Element? { storage[storage.count-1] }
  
  mutating func enqueue(_ element: Element) {
    storage.append(element)
  }
  
  mutating func dequeue() -> Element? {
    guard storage.count > 0 else { return nil }
    return storage.remove(at: 0)
  }
}

extension Queue where Element: Prioritized {
  
  mutating func dequeue() -> Element? {
    guard storage.count > 0 else { return nil }
    var choice = storage[0]
    var choiceIndex = 0
    
    for (index, item) in storage.enumerated() where item.priority > choice.priority {
      choice = item
      choiceIndex = index
    }
    return storage.remove(at: choiceIndex)
  }
}

// MARK: - Deque

struct Deque<Element> {
  
  private var storage = [Element]()
  
  var first: Element? { storage.first }
  var last: Element? { storage.last }
  
  
  mutating func prepend(_ element: Element) {
    storage.insert(element, at: 0)
  }
  
  mutating func append(_ element: Element) {
    storage.append(element)
  }
  
  @discardableResult
  mutating func dequeueFront() -> Element? {
    guard storage.count > 0 else { return nil }
    return storage.remove(at: 0)
  }
  
  mutating func dequeueBack() -> Element? {
    guard storage.count > 0 else { return nil }
    return storage.removeLast()
  }
}

extension Deque where Element: Equatable {
  
  func firstIndex(of element: Element) -> Int? {
    for (index, current) in storage.enumerated() where current == element {
      return index
    }
    return nil
  }
  
  func first(_ element: Element) -> Element? {
    for (index, current) in storage.enumerated() where current == element {
      return storage[index]
    }
    return nil
  }
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    storage.contains(element)
  }
}

// MARK: - Priority

protocol Prioritized {
  
  var priority: Int { get }
}

struct Work: Prioritized {
  let name: String
  let priority: Int
}

let l = Work(name: "Low", priority: 1)
let ml = Work(name: "Medium Low", priority: 2)
let m = Work(name: "Medium", priority: 3)

var work = Queue<Work>()
work.enqueue(l)
work.enqueue(ml)
work.enqueue(m)

print(work.dequeue())
print(work.dequeue())
