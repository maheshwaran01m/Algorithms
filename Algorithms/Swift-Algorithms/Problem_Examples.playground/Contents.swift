import Foundation

// MARK: - Valid Parentheses
/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 - Open brackets must be closed by the same type of brackets.
 - Open brackets must be closed in the correct order.
 - Every close bracket has a corresponding open bracket of the same type.
 
 */
func exampleForValidParentheses(_ s: String  = "()[]") -> Bool {
  guard s.count % 2 == 0 else { return false }
  
  var char = [Character]()
  
  for item in s {
    switch item {
    case "(": char.append(")")
    case "[": char.append("]")
    case "{": char.append("}")
    default:
      if char.isEmpty || char.removeLast() != item {
        return false
      }
    }
  }
  
  return char.isEmpty
}
exampleForValidParentheses()

// MARK: - 26. Remove Duplicates from Sorted Array
/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
  let count = nums.count
  
  guard count > 1 else { return count }
  var index = 0
  
  for i in nums {
    if i != nums[index] {
      index += 1
      nums[index] = i
    }
  }
  return index + 1
}

var i = [0,0,1,1,1,2,2,3,3,4]
//print(removeDuplicates(&i))

// MARK: - Binary Search
/*
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.
 */

func binarySearch(_ nums: [Int] = [-1,0,3,5,9,12], _ target: Int = 0) -> Int {

  //  var left = 0
//  var right = nums.count-1
//  
//  while left <= right {
//    let middle = (left+right)/2
//
//    if nums[middle] == target { return middle }
//    else if nums[middle] < target { left = middle + 1 }
//    else if nums[middle] > target { right = middle - 1 }
//  }
//  return -1
  
  var lhs = 0, rhs = nums.count - 1
  
  while lhs <= rhs {
    let mid = (lhs+rhs)/2
    
    if nums[mid] == target {
      return mid
    } else {
      nums[mid] < target ? (lhs=mid+1) : (rhs=mid-1)
    }
  }
  return -1
}
binarySearch()
