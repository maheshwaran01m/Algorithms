import Foundation

/// Time Complexity
/*
var start = CFAbsoluteTimeGetCurrent()
var end = CFAbsoluteTimeGetCurrent()

print("Time Complexity: \(end - start)")
*/

let stringArray = """
To run the test, you'll be connected to Measurement Lab (M-Lab) and your IP address will be shared with them and processed by them in accordance with their privacy policy. M-Lab conducts the test and publicly publishes all test results to promote Internet research. Published information includes your IP address and test results, but doesn’t include any other information about you as an Internet user.
""".split(separator: " ").map { $0.description }

// MARK: - Even Numbers

@discardableResult
func exampleForEvenNumbers(_ values: [Int]) -> [Int] {
  var final = [Int]()
  
  for value in values where value%2==0 {
    final.append(value)
  }
  return final
}
//print(exampleForEvenNumbers([1,3,4,5,7,9]))

// MARK: - Odd Numbers

@discardableResult
func exampleForOddNumbers(_ values: [Int]) -> [Int] {
  var final = [Int]()
  
  for value in values where value%2 != 0 {
    final.append(value)
  }
  return final
}

//print(exampleForOddNumbers([1,3,4,5,7,9]))

// MARK: - Addition of n numbers

@discardableResult
func additionOfN_Numbers(_ number: Int) -> Int {
  (number+1)*number/2
}
additionOfN_Numbers(3)  // Time complexity: O(1)

// MARK: - Prime Number

func isPrimeNumber(_ n: Int) -> Bool {
  guard n > 1 else { return false }
  if n == 2 { return true }
  
  for i in 2..<n {
    return n%i != 0
  }
  return false
}
isPrimeNumber(0)

// MARK: - Palindrome

func checkPalindrome(arr: [Int] = [9, 1, 8, 4, 8, 1, 9]) -> Bool  {
  var start = 0
  var end = arr.count - 1
  
  while start < end  {
    if arr[start] != arr[end] {
      return false
    }
    start += 1
    end -= 1
  }
  return true
}

//checkPalindrome()

func checkPalindromeString(_ string: String = "aba") -> Bool {
  if string.count == 0 { return false }
  var index = 0
  let characters = Array(string)
  
  while index < characters.count/2 {
    if characters[index] != characters[(characters.count - 1) - index] {
      return false
    }
    index += 1
  }
  return true
  
  /*
   let characters = Array(string)
   var initialIndex = 0
   var finalIndex = characters.count - 1
   
   while initialIndex < finalIndex {
   if characters[initialIndex] != characters[finalIndex] {
   return false
   }
   initialIndex += 1
   finalIndex -= 1
   }
   return true
   */
}
//checkPalindromeString()

// MARK: - ReverseNumbers

func reverseNumbersUsingWhileLoop(_ values: [Int] = [1, 2, 3, 4, 5, 6]) -> [Int] {
  var newValues = [Int]()
  var index = values.count-1
  
  while index != -1 {
    newValues.append(values[index])
    index -= 1
  }
  return newValues
}
//print("While Loop -",reverseNumbersUsingWhileLoop())

func reverseNumbersUsingForLoop(values: [Int] = [1, 2, 3, 4, 5, 6]) -> [Int] {
  var newValues = [Int]()
  var index = values.count-1
  
  for _ in values {
    newValues.append(values[index])
    index-=1
  }
  return newValues
}
//print("For Loop -",reverseNumbersUsingForLoop())

// MARK: - Reverse Strings

func reverseStringUsingForLoop(_ string: String) -> String {
  var result = ""
  
  for strchar in string {
    result = "\(strchar)" + result
  }
  return result
}
//print("Original: abcd efgh", "\nReverse:", reverseStringUsingForLoop("abcd efgh"))

// MARK: - Fibonacci Series

func fibonacciSeries(_ n: Int = 10) -> [Int] {
  var values = [Int]()
  
  for i in 0...n {
    values.append((i == 0 || i == 1) ? i : values[i-1] + values[i-2])
  }
  
  return values
}
//print("Fibonacci Series:",fibonacciSeries(), "\n")

func sumOfFibonacciSeries(_ n: Int = 9) -> Int {
  guard n > 1 else { return n }
  return sumOfFibonacciSeries(n-1) + sumOfFibonacciSeries(n-2)
}
//print("Sum of Fibonacci Series: ",sumOfFibonacciSeries())

// MARK: - Sorting

func sortedArray(_ values: [Int] = [9, 1, 8, 1, 3, 5, 10, 2, 8, 23, 6, -1]) -> [Int] {
  /*
   var values = values
   
   for i in 0..<values.count {
   for j in 0..<values.count {
   var temp = 0
   
   if isAscending ? values[i] < values[j] : values[i] > values[j] {
   temp = values[i]
   values[i] = values[j]
   values[j] = temp
   }
   }
   }
   return values
   */
  
  if values.count < 2 { return values }
  let mid = values.count/2
  
  var lhs = sortedArray(Array(values[..<mid]))
  var rhs = sortedArray(Array(values[mid..<values.count]))
  
  var sortedValues = [Int]()
  
  while lhs.count > 0 && rhs.count > 0 {
    if lhs[0] < rhs[0] {
      sortedValues.append(lhs[0])
      lhs.remove(at: 0)
    } else {
      sortedValues.append(rhs[0])
      rhs.remove(at: 0)
    }
  }
  return sortedValues+lhs+rhs
}
//print(sortedArray())

// MARK: - Patterns

protocol Shape {
  func draw() -> String
}

struct Triangle: Shape {
  var size: Int
  func draw() -> String {
    var result: [String] = []
    for length in 1...size {
      result.append(String(repeating: "*", count: length))
    }
    return result.joined(separator: "\n")
  }
}
let smallTriangle = Triangle(size: 3)
//print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
//print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
       return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
//print(joinedTriangles.draw())

// MARK: - Mean Average

func meanAverage(_ numbers: [Double] = [1, 2, 3, 4, 5, 6, 7, 8]) -> Double {
  guard !numbers.isEmpty else { return 0 }
  
  var total = 0.0
  
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

//print(meanAverage())

// MARK: - Functions as first class types

/*
let notEqual = (!)
print(notEqual(true))

let add: (Int, Int) -> Int = (+)

print(add(1, 5))

*/

// MARK: - Occurences

func countOccurrences(of search: Character, in input: String) -> Int {
  
  var count = 0
  for i in input where i == search {
    count += 1
  }
  return count
}
//countOccurrences(of: "i", in: "Mississippi")

/// ``Write A pangram is string that contains every letter of the alphabet at least once``

private func writePangram(_ string: String = "The Quick Brown fox jumps over the lazy dog") -> Bool {
  /*
  var alphabet = "abcdefghijklmnopqrstuvwxyz"
  
  for letter in string.lowercased() {
    if alphabet.contains(letter) {
      alphabet = alphabet.replacingOccurrences(of: String(letter), with: "")
      if alphabet.count == 0 {
        return true
      }
    }
  }
  return false
  */
  let alphabet = Set("abcdefghijklmnopqrstuvwxyz")
   let lowercased = Set(string.lowercased())
   
   return lowercased.isSuperset(of: alphabet)
}

writePangram().description

/// ``Three Differences Solution``

private func writeThreeDifferences(_ a: String = "Clamp", b: String = "Crams") -> Bool {
  guard a.count == b.count else { return false }
  
  var lhs = Array(a)
  var rhs = Array(b)
  var difference = 0
  
  for (index, letter) in lhs.enumerated() where rhs[index] != letter {
    difference += 1
    if difference > 3 {
      return false
    }
  }
  return true
}
writeThreeDifferences("clamp", b: "grans").description

/// ``Given a string, return number of vowels and consonants``

private func writeVowelsAndConsonants(_ string: String) -> (Int?, Int?) {
  guard !string.isEmpty else { return (nil, nil) }
  
  let letters = string.lowercased().filter { $0 >= "a" && $0 <= "z" }
  
  let vowels = letters.filter { "aeiou".contains($0) }
  
  return (vowels.count, letters.count - vowels.count)
}

writeVowelsAndConsonants("dsa in swift ?????")

/// ``Given string with letters and numbers, pull all the numbers then return their sum``

private func sumOfNumbers(_ string: String) -> Int {
  guard !string.isEmpty else { return 0 }
  var count = 0
  
  for letter in string {
    if let value = Int(String(letter)) {
      count += value
    }
  }
  
  return count
}
sumOfNumbers("a1b2c3").description

/// ``Palindromes``

private func writePalindromes(_ string: String = "wow") -> Bool {
  guard !string.isEmpty else { return false }
//  return string.lowercased() == String(string.lowercased().reversed())
  
  var reversedString = ""
  for letter in string {
    reversedString = letter.description + reversedString
  }
  return reversedString.lowercased() == string.lowercased()
}

writePalindromes().description

/// ``Reversed String``

private func writeReversedString(_ string: String = "mot") -> String {
  var reversedString = ""
  for letter in string {
    reversedString = "\(letter)" + reversedString
  }
  return reversedString
}
writeReversedString().description

/// ``Reversed Int``
private func writeReversedInt(_ value: Int = -123) -> Int {
  var input = value, output = 0, negative = 1
  
  if input < 0 {
    negative = -1
    input = input * negative
  }
  
  while input > 0 {
    let lastDigit = input % 10
    input = input / 10
    output = (output * 10) + lastDigit
  }
  output = output * negative
  
  return output
}
writeReversedInt().description

/// ``Run Length Encoding``
private func writeRunLengthEncoding(_ string: String = "aabbcc") -> String {
  guard !string.isEmpty else { return "" }
  var length = ""
  var count = 0
  
  for (index, letter) in string.enumerated() {
    if index == 0 {
      length.append(letter)
    }
    if letter != length.last {
      length.append(String(count))
      length.append(letter)
      count = 1
    } else {
      count += 1
    }
  }
  length.append(String(count))
  
  return length
}
writeRunLengthEncoding().description

/// ``Unique strings``
private func writeUniqueStrings(_ string: String = "abc") -> Bool {
  guard !string.isEmpty else { return false }
  var storage = [Character]()
  
  for letter in string {
    if !storage.contains(letter) {
      storage.append(letter)
    } else {
      return false
    }
  }
  return true
}
writeUniqueStrings().description

/// ``Detect the number from given 0 to  9223372036854775807``
private func writeDectectorFinal(_ value: Int) -> String {
  guard value >= 0 && value < Int.max else { return "" }
  
  var array = Array(String(value))
  
  var index = 0
  var counter = 0
  var finalString = ""
  
  for _ in 0..<Int.max {
    if array[0+index].description == counter.description {
      finalString.append(Character(counter.description))
      index += 1
      counter = 0
      if index == array.count {
        return finalString
      }
    } else {
      counter += 1
    }
  }
  return finalString
}
writeDectectorFinal(9223372036854775806).description


/// ``Rotate a string to get another string then return values``
private func writeIsRotated(_ lhs: String = "tom", rhs: String = "mot") -> Bool {
  guard lhs.count == rhs.count else { return false }
  
  var reversed = ""
  for letter in lhs {
    reversed = "\(letter)" + reversed
  }
  return reversed == rhs // -> 0.00026297569274902344
  // (lhs+lhs).contains(rhs) -> 0.0006890296936035156
}
writeIsRotated("ab", rhs: "ba").description


/// ``Identify Duplicates in array of strings, without for-loop``
private func writeDuplicateInStrings(_ values: [String]) -> [String] {
  guard !values.isEmpty else { return [] }
  
  var set = Set<String>()
  return values.filter { !set.insert($0).inserted }
  
  /*
  var finalValues: [String] = []
  var duplicates: Set<String> = []
  var index = 0
  
  while index < values.count {
    
    if duplicates.contains(values[index]) {
      finalValues.append(values[index])
    } else {
      duplicates.insert(values[index])
    }
    index += 1
  }
  
  return finalValues // time: 0.0017169713973999023 ~ 0.005265951156616211
   */
}

writeDuplicateInStrings(["a", "b", "c"]).description

private func filterStrings<T>(for values: [T], isEnabled: (T) -> Bool) -> [T] {
  var result = [T]()
  
  for element in values {
    if isEnabled(element) {
      result.append(element)
    }
  }
  return result
}
filterStrings(for: (0...1000).map { $0 }) { $0%2==0 }.description

/// `` Letter and word pairs``
private func writeALetterAndPairs(_ values: [String] = ["example", "for", "algorithms"]) -> [Character: String] {
  guard !values.isEmpty else { return [:] }
  var dictionary = [Character: String]()
  
  for i in values {
    dictionary.updateValue(i, forKey: i.first!)
  }
  return dictionary
}

writeALetterAndPairs().description

/// ``Write FizzBuzz``
private func writeFizzBuzz(_ n: Int = 100) {
  for i in 1...n {
    if i%15==0 {
      print("FizzBuzz")
    } else if i%5==0 {
      print("Buzz")
    } else if i%3==0 {
      print("Fizz")
    } else {
      print(i)
    }
  }
}
//writeFizzBuzz()

/// ``Prime Numbers``
private func writePrimeNumbers(_ n: Int = 100) {
  guard n > 1 else { return }
  if n == 2 { print(2) }
  
  for i in 2...n where i%2 != 0 {
    print(i)
  }
}
//writePrimeNumbers()

/// ``Best time to buy and sell stocks``

func maxProfit(_ prices: [Int]) -> Int {
  var minimum: Int = Int.max
  var profit: Int = 0
  
  for (index, element) in prices.enumerated() {
    
    if element < minimum {
      minimum = element
    } else {
      profit = max(profit, element - minimum)
    }
  }
  return profit
}
/// ``Most common element``

private func writeMostCommonElement(_ values: [String]) -> [String] {
  guard !values.isEmpty else { return [] }
  
  var dictionary = [String: Int]()
  
  for value in values {
    if let count = dictionary[value] {
      dictionary[value]! += 1
    } else {
      dictionary.updateValue(1, forKey: value)
    }
  }
  /*
  let keys = dictionary.filter { $0.value == dictionary.values.max() }.keys
  return Array(keys)
   */
  var final = [String]()
  for i in dictionary {
    // peek value
    /*
    if i.value == dictionary.values.max() {
      final.append(i.key)
    }
     */
    // more than 1
    if i.value > 1 {
      final.append(i.key)
    }
  }
  return final
}
writeMostCommonElement(["a", "b", "a"]).description

private func writeMostCommonElementsCount(_ values: [String]) -> [String: Int] {
  guard !values.isEmpty else { return [:] }
  
  var dictionary = [String: Int]()
  
  for value in values {
    if let count = dictionary[value] {
      dictionary[value]! += 1
    } else {
      dictionary.updateValue(1, forKey: value)
    }
  }
  return dictionary
}
writeMostCommonElementsCount(["a", "b", "a"]).description

/// ``Only Numbers``
private func writeOnlyNumbers(_ value: String) -> Bool {
  /*
  for i in value where Int(String(i)) == nil {
    return false
  }
  return true
  */
  
//  return value.count == value.filter { $0 >= "0" && $0 <= "9" }.count
  
  return Int(value) != nil // !value.contains("0123456789")
}
writeOnlyNumbers("abc123").description

/// ``Only Number Values``
private func writeOnlyNumberValues(_ value: String) -> String {
  return value.filter { ("0"..."9").contains($0) }
}
writeOnlyNumberValues("abc123").description

/// ``Number of times a character appears in string without using for loop``
private func writeNumberOfTimesCharacterAppears(_ value: String, key: Character) -> Int {
//  return value.count - value.replacingOccurrences(of: key, with: "").count
  
  var count = 0
  for letter in value where letter == key {
    count += 1
  }
  return count
}
writeNumberOfTimesCharacterAppears("apple", key: "p").description

/// ``Permutations of given string``
private func writePermutationOfString(_ value: String, currentValue: String = " ") {
  guard currentValue.count > 0 else { return }
  let array = Array(value)
  
  print(currentValue)
  for letter in 0..<value.count {
    let leftString = String(array[0..<letter])
    let rightString = String(array[letter + 1..<array.count])
    
    writePermutationOfString(leftString + rightString, currentValue: currentValue + String(array[letter]))
  }
}
//writePermutationOfString("ab")

/// `` Find missing numbers``
private func findMissingNumbers(_ values: [Int]) -> [Int] {
  guard !values.isEmpty else { return [] }
  var missing = [Int]()
  var index = 0
  
  while index < values.count-1 {
    if !values.contains(values[index]+1) {
      missing.append(values[index]+1)
    }
    index+=1
  }
  return missing
}
findMissingNumbers([1,3, 5, 7]).description

/// ``Deques - double-ended queue``

struct Deque<T> {
  
  private var storage = [T]()
  
  var count: Int { storage.count }
  var isEmpty: Bool { storage.count == 0 }
  
  mutating func insert(_ element: T) {
    storage.insert(element, at: 0)
  }
  
  mutating func push(_ element: T) {
    storage.append(element)
  }
  
  @discardableResult
  mutating func remove(_ index: Int) -> T? {
    storage.remove(at: index)
  }
  
  @discardableResult
  mutating func pop() -> T? {
    storage.popLast()
  }
}

extension Deque: CustomStringConvertible {
  var description: String { storage.description }
}

var dequeExample = Deque<Int>()
dequeExample.push(1)
dequeExample.push(2)
dequeExample.pop()
dequeExample.description

/// ``Add All Numbers``
private func writeAddAllNumbers<T: Numeric>(_ values: [T]) -> T {
  var finalValue: T = 0
  
  for i in values {
    finalValue += i
  }
  return finalValue
}
writeAddAllNumbers([1, 2, 3, 4, 5])

/// ``Binary Ones Representation``
private func writeBinaryRepresentation(_ value: Int) -> (Int?, Int?) {
  let number = String(value, radix: 2)
  let binary = number.filter { $0 == "1" }.count
  
  var nextHighest: Int?
  var nextLowest: Int?
  
  for i in value + 1...Int.max {
    let currentBinary = String(i, radix: 2)
    let count = currentBinary.filter { $0 == "1" }.count
    
    if count == binary {
      nextHighest = i
      break
    }
  }
  
  for i in (0..<value).reversed() {
    let currentBinary = String(i, radix: 2)
    let count = currentBinary.filter { $0 == "1" }.count
    
    if count == binary {
      nextLowest = i
      break
    }
  }
  
  return (nextLowest, nextHighest)
}
writeBinaryRepresentation(12)

/// ``Binary Reversed``
private func writeBinaryReversed(_ value: UInt) -> UInt? {
  var binary = Array(String(value, radix: 2))
  var reversed = ""
  
  for index in 0...7 {
    if reversed.count < binary.count {
      reversed.insert(binary[index], at: reversed.startIndex)
    } else {
      reversed.append("0")
    }
  }
  
  return UInt(reversed, radix: 2)
}
writeBinaryReversed(41)


/// `` Sieves of Eratoshenes``
/// return an array of prime numbers from 2 up to but excluding n
private func writeSievesOfEratoshenes(_ key: Int) -> [Int] {
  guard key > 1 else { return [] }
  
  var numbers = [Bool](repeating: true, count: key)
  numbers[0] = false
  numbers[1] = false
  
  let sqrt = Int(ceil(sqrt(Double(key))))
  
  for i in 2...sqrt where numbers[i] {
    for j in stride(from: i * i, to: key, by: i) {
      numbers[j] = false
    }
  }
  return numbers.enumerated().compactMap { $1 ? $0 : nil }
}
writeSievesOfEratoshenes(10).description


// MARK: - Linked List

/// ``Linked List``

class Node<T> {
  var value: T
  var next: Node<T>?
  
  init(_ value: T) {
    self.value = value
  }
}

class LinkedList<T> {
  
  var head: Node<T>?
  
  func printNode() {
    var currentNode = head
    
    while let node = currentNode {
//      print(node.value, terminator: " ")
      currentNode = node.next
    }
  }
}

var linkedListExample = LinkedList<Character>()
var previous: Node<Character>?

for letter in "abcdefghijklmnopqrstuvwxyz" {
  let node = Node(letter)
  
  if previous != nil {
    previous?.next = node
  } else {
    linkedListExample.head = node
  }
  previous = node
}
linkedListExample.printNode()

/// ``LinkedList middle node``

extension LinkedList {
  
  var middle: Node<T>? {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
    }
    return slow
  }
}
linkedListExample.middle?.value // time: O(n)


/// ``Find number of X in game of tic tac toe``

private func writeNumberOfXInTicTacToe(_ values: [[String]]) -> Int {
  guard !values.isEmpty else { return 0 }
  var total = 0
  
  for index in 0..<values.count {
    for letter in values[index] where letter == "x" {
      total += 1
    }
  }
  return total //values.flatMap { $0 }.filter { $0 == "x"}.count
}
writeNumberOfXInTicTacToe([["x", "x", "o"], ["o", "x", "o"], ["x", "o", "x"]]).description


/// ``Find the winner of tic tac toe``
private func writeWinnerOfTicTacToe(_ values: [[String]]) -> Bool {
  guard !values.isEmpty else { return false }
  
  let winner = [1: [0,1,2], 2: [0, 4, 8], 3: [0, 3, 6],
                4: [1, 4, 7], 5: [2, 5, 8], 6: [2, 4, 6],
                7: [3, 4, 5], 8: [6, 7, 8]]
  
  let array = values.flatMap { $0 }
  
  for index in winner.values {
    if array[index[0]] == "x", array[index[1]] == "x",  array[index[2]] == "x" {
      return true
    }
    
    if array[index[0]] == "o", array[index[1]] == "o",  array[index[2]] == "o" {
      return true
    }
  }
  
  return false
}

writeWinnerOfTicTacToe([["x", "", "o"], ["", "x", "o"], ["", "", "x"]]).description

/// ``Remove the duplicates from sorted array in-place withou extra allocation``
private func writeRemoveDuplicates(_ values: inout [Int]) -> [Int] {
  guard !values.isEmpty else { return [0] }
  
  var current = 0
  var index = 0
  
  for (i, value) in values.enumerated() {
    if i == 0 {
      current = value
    } else {
      if current == value {
        values.remove(at: i - index)
        index += 1
      } else {
        current = value
      }
    }
  }
  return values
  // NSOrderedSet(array: values).array
}
var removeDuplicates  = [0,0, 1, 1, 1, 2, 2, 2, 3, 3, 4, 5, 5, 5, 6, 6, 7, 7]
writeRemoveDuplicates(&removeDuplicates).description
