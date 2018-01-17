def sort(arr_to_sort)
    puts "sorting #{arr_to_sort.inspect}"
    helper = Array.new
    split_and_merge(arr_to_sort, helper, 0, arr_to_sort.length-1)
    puts "sorted array: #{arr_to_sort.inspect}"
end

def split_and_merge(arr, helper, start, ending)
    return unless ( start < ending )
    mid = (ending + start) / 2
    split_and_merge(arr, helper, start, mid)
    split_and_merge(arr, helper, mid+1, ending)
    merge(arr, helper, start, ending)
end

def merge(arr, helper, start, ending)
    for i in start..ending
        helper[i] = arr[i]
    end

    middle = ((start+ending)/2)
    helperLeftIndex = start
    helperRightIndex = middle+1
    targetIndex = start

    while ( (helperLeftIndex <= middle) && (helperRightIndex <= ending) ) do
        if helper[helperLeftIndex] <= helper[helperRightIndex]
            arr[targetIndex] = helper[helperLeftIndex]
            helperLeftIndex += 1
        else
            arr[targetIndex] = helper[helperRightIndex]
            helperRightIndex += 1
        end
        targetIndex += 1
    end

    remaining = middle - helperLeftIndex
    for i in 0..remaining do
        arr[targetIndex+i] = helper[helperLeftIndex+i]
    end
end

arr_to_sort = [ 9, 8, 7, 6, 5, 4, 3, 2, 1 ]
sort(arr_to_sort)
