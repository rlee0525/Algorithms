def bubble_sort(array):
    i = 0
    while i < len(array):
        j = i + 1
        while j < len(array):
            if array[i] > array[j]:
                array[i], array[j] = array[j], array[i]
            j += 1
        i += 1

    return array

print bubble_sort([1,2,45,1,3,4,7,2,1,100,312])
