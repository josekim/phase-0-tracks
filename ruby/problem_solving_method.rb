#for each number in array
#check if num = number in array
#return index of number if matches
#return something else if no match - mayb nil

#discover length of array
#check array .length num of times
#if num = value of array, return index -1
def search_array (array, num)
  array.length.times {|index|
    # p "loop:#{index}"
    if num == array[index]
      return index
    end
  }
return nil
end
arr = [42, 89, 23, 1]
p search_array(arr, 1)
p search_array(arr, 24)

#recieve num
#sequence fibonnaci to index of num
#negative index -1 + -2
#push sum to end of array
#repeat until index = num
#return entire array
def fib (num)
  fibarray = [0, 1]
  if num == 0
    return []
  elsif num == 1
    return [0]
  else
    num -= 2
    num.times {
      sum = fibarray[-1] + fibarray[-2]
      fibarray.push(sum)
    }
    return fibarray
  end
end
p fib(6)
p fib(2)
p fib(100)[-1] == 218922995834555169026

#create bubble sort
#compare array at first two indexes
#swap based off size, lowest comes first
#check next number - index up, repeat process
#once no swapping is happening, exit
def sortarray (array)
  rounds = array.length - 1
  swap = true
  while swap == true
  swap = false
  rounds.times {|index|
    if array[index] > array[index + 1]
      value1 = array[index]
      array[index] = array[index + 1]
      array[index + 1] = value1
      swap = true
    end
  }
  end
return array
end
array = [1, 5, 2, 7, 8, 3, 9 ,11, 32, 424,343,124,345,234,123,47864,2346,15,3,56,26,0,-1,-5,-2346,354,6,7,3,1,1]
p array
p sortarray(array)