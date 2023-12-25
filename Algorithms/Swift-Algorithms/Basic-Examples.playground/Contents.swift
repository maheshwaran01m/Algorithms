import Foundation

/// Time Complexity
/*
var start = CFAbsoluteTimeGetCurrent()
var end = CFAbsoluteTimeGetCurrent()

print("Time Complexity: \(end - start)")
*/

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
