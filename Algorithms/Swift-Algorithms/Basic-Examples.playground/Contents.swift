import Foundation

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
