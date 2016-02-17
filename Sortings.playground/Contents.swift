//: Playground - noun: a place where people can play

import UIKit

func bubbleSort(var numberList: [Int]) -> [Int] {
    
    var z, passes, key: Int
    
    //track collection iterations
    for x in 0..<numberList.count {
        
        passes = (numberList.count - 1) - x
        
        //use shorthand "half-open" range operator
        for y in 0..<passes {
            key = numberList[y]
            
            //compare and rank values
            if (key > numberList[y + 1]) {
                z = numberList[y + 1]
                numberList[y + 1] = key
                numberList[y] = z
            }
        }
    }
    return numberList
} //end function

var array = [2, 34, 23, 14, 60, 1]
bubbleSort(array)

func bubble(var numList: [Int]) -> [Int] {
    
    for j in 0..<numList.count - 1 {
        for i in 0..<numList.count - 1 - j {
            if (numList[i] > numList[i + 1]) {
                swap(&numList[i], &numList[i + 1])
            }
        }
    }
    
    return numList
}

bubble(array)

func bubbleS(var numList: [Int]) -> [Int] {
    var temp: Int
    for j in 0..<numList.count - 1 {
        for i in 0..<numList.count - 1 - j {
            if (numList[i] > numList[i + 1]) {
                temp = numList[i + 1]
                numList[i + 1] = numList[i]
                numList[i] = temp
            }
        }
    }
    return numList
}

bubble(array)

// Selection Sort
func select(xs: [Int], startingAt k: Int) -> Int {
    var minIndex = k
    for i in (k+1)..<xs.count {
        if xs[i] < xs[minIndex] {
            // we found a new minimum
            minIndex = i
        }
    }
    return minIndex
}

select([0, 1, 2, 3, 9, 5, 4, 6], startingAt: 4)
select([8, 6, 7, 5, 3, 0, 9], startingAt: 0)

func selection_sort(inout xs: [Int]) -> [Int] {
    for sortedSoFar in 0..<xs.count {
        let minIndex = select(xs, startingAt: sortedSoFar)
        (xs[sortedSoFar], xs[minIndex]) = (xs[minIndex], xs[sortedSoFar])
    }
    return xs
}

var xs = [8, 6, 7, 5, 3, 0, 9]
selection_sort(&xs)

func selectionSort(var numList: [Int]) -> [Int]{
    for i in 0..<numList.count {
        var curMin = i
        for (var j = i + 1; j < numList.count; j++ ) {
            if (numList[j] < numList[curMin]) {
                curMin = j
                swap(&numList[i], &numList[curMin])
            }
        }
    }
    
    return numList
}

selectionSort(xs)


// Insertion Sort
//Method 0 -
//Insertion sort - rank items by comparing each key in the list

func insertionSort(var numberList: [Int]) -> [Int] {
    var x, y, key: Int
    for (x = 0; x < numberList.count; x++) {
        key = numberList[x]
        for (y = x; y > -1; y--) {
            if (key < numberList[y]) {
                numberList.removeAtIndex(y + 1)
                numberList.insert(key, atIndex: y)
            }
        }
    }
    return numberList
}

insertionSort(array)


func insert(var numList: [Int]) -> [Int] {
    var i, key: Int
    for j in 0..<numList.count {
        key = numList[j]
        for (i = j; i > -1; i--) {
            if (key < numList[i]) {
                numList.removeAtIndex(i + 1)
                numList.insert(key, atIndex: i)
            }
        }
    }
    return numList
}

insert(array)

//Method 1
func insertionSort1(var numberList: [Int]) -> [Int] {
    var y,  key : Int
    
    for x in 0..<numberList.count {
        
        //obtain a key to be evaluated
        key = numberList[x]
        
        //iterate backwards through the sorted protion
        for (y = x; y > -1; y--) {
            
            if (key < numberList[y]) {
                
                // remove item from original position
                numberList.removeAtIndex(y + 1)
                
                //insert the number at the key position
                numberList.insert(key, atIndex: y)
            }
        }
    } // end for
    
    return numberList
} // end function

insertionSort1(array)


//Method 2 ---Insertion

func insert(x: Int, var intoSortedList xs: [Int]) -> [Int] {
    var didInsertX = false
    for i in 0..<xs.count {
        if (x < xs[i]) {
            xs.insert(x, atIndex: i)
            didInsertX = true
            break
        }
    }
    if !didInsertX {
        xs.append(x)
    }
    return xs
}

insert(3, intoSortedList: [1, 2, 4, 5])

func insertion_sort(xs: [Int]) -> [Int] {
    var sortedSoFar = [Int]()
    for x in xs {
        sortedSoFar = insert(x, intoSortedList: sortedSoFar)
    }
    return sortedSoFar
}

insertion_sort(array)

// Quick Sort

func quickSort(inout arr: [Int], first: Int, last: Int) {
    // base case
    if first >= last { return }
    // partition
    let splitPoint = partition(&arr, first: first, last: last)
    // quickSort on leftHalf
    quickSort(&arr, first: first, last: splitPoint - 1)
    // quickSort on rightHalf
    quickSort(&arr, first: splitPoint + 1, last: last)
}


func quickSort(inout arr: [Int]) {
    quickSort(&arr, first: 0, last: arr.count-1)
}

func partition(inout arr: [Int], first: Int, last: Int) -> Int {
    // set pivotValue to firstElement
    let pivotValue = arr[first]
    // set leftMark
    var leftMark = first + 1
    // set rightMark
    var rightMark = last
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    
    while leftMark <= rightMark {
        while leftMark <= rightMark && arr[leftMark] <= pivotValue  {
            leftMark += 1
        }
        
        while rightMark >= leftMark && arr[rightMark] >= pivotValue {
            rightMark -= 1
        }
        if leftMark < rightMark {
            swap(&arr[leftMark], &arr[rightMark])
        }
    }
    // set the correct value at the splitPoint
    if first != rightMark {
        swap(&arr[first], &arr[rightMark])
    }
    
    return rightMark  // return the splitPoint
}

var numbers = [22, 59, 38, 93,95, 0, 34, 58, 72, 15]

quickSort(&numbers)


func quickSort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    // base case
    if firstIdx >= lastIdx { return }
    // partition
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    // quickSort on rightHalf
    quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)
}

func quickSort1(inout arr: [Int]) {
    quickSort(&arr, firstIdx: 0, lastIdx: arr.count-1)
}

func partition(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> Int {
    // set pivotValue to firstElement
    let pivotValue = arr[firstIdx]
    // set leftMark
    var leftMark = firstIdx + 1
    // set rightMark
    var rightMark = lastIdx
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    while leftMark <= rightMark {
        while arr[leftMark] < pivotValue && leftMark <= rightMark {
            leftMark += 1
        }
        while arr[rightMark] > pivotValue && leftMark <= rightMark{
            rightMark -= 1
        }
        if leftMark < rightMark {
            swap(&arr[leftMark], &arr[rightMark])
        }
    }
    // set the correct value at the splitPoint
    if firstIdx != rightMark {
        swap(&arr[firstIdx], &arr[rightMark])
    }
    return rightMark  // return the splitPoint
}

var numbers2 = [22, 59, 38, 93,95, 0, 34, 58, 72, 15]

quickSort1(&numbers2)

func partition(xs: [Int], pivot: Int) -> ([Int], [Int]) {
    return (xs.filter{$0 < pivot}, xs.filter{$0 > pivot})
}

partition([1, 4, 2, 5], pivot: 3)

func qsort(xs: [Int]) -> [Int] {
    if (xs.isEmpty) {
        return []
    }
    let pivot = xs[0]
    let (ys, zs) = partition(xs, pivot: pivot)
    return qsort(ys) + [pivot] + qsort(zs)
}

qsort([8, 6, 7, 5, 3, 0, 9])



// Merge Sort

func mergeSort(values: [Int]) -> [Int] {
    let n = values.count
    // Check length of values, return values if count is less than 2
    if n < 2{
        return values
    }
    // Split values into left and right (roughly equal size)
    
    var left = Array(values[0..<n / 2])
    var right = Array(values[n / 2..<n])
    
    // Sort the left half
    left = mergeSort(left)
    
    // Sort the right half
    right = mergeSort(right)
    
    // Merge the two halves together
    // Return the result
    
    return merge(withLeftArray: left, andRightArray: right)
}
func merge(withLeftArray left: [Int], andRightArray right: [Int]) -> [Int] {
    // Iterate over both left and right at the same time
    var i = 0
    var j = 0
    var result: [Int] = []
    while i < left.count || j < right.count {
        
        if j >= right.count {
            result.append(left[i])
            i++
            continue
        }
        else if i >= left.count {
            result.append(right[j])
            j++
            continue
        }
        
        if left[i] <= right[j] {
            result.append(left[i])
            i++
        }else{
            result.append(right[j])
            j++
        }
        
    }
    // Take the minimum of the two and add it to the result
    
    return result // <-- change this
}
mergeSort([10, 2, 6, 5, 7])
merge(withLeftArray: [3, 6], andRightArray: [1, 2])
mergeSort(array)


func mergeSort1(var numList: [Int]) -> [Int] {
    if numList.count < 2 { return numList }
    
    var left = Array(numList[0..<numList.count/2])
    var right = Array(numList[numList.count/2..<numList.count])
    
    left = mergeSort1(left)
    right = mergeSort1(right)
    
    return merge1(withLeftArray: left, andRightArray: right)
    
}

func merge1(var withLeftArray left: [Int], var andRightArray right: [Int]) -> [Int] {
    
    var result : [Int] = []
    while left.count != 0 && right.count != 0 {
        if (left[0] <= right[0]) {
            result.append(left[0])
            left.removeAtIndex(0)
        } else {
            result.append(right[0])
            right.removeAtIndex(0)
        }
    }

    return result + left + right
}

mergeSort1(array)







