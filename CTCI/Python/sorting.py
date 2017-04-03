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

def merge_sort(array):
    if len(array) < 2:
        return array
    mid = len(array) / 2
    left = merge_sort(array[0:mid])
    right = merge_sort(array[mid:])

    return merge(left, right)

def merge(left, right):
    result = []
    i, j = 0, 0

    while len(left) > j and len(right) > i:
        if left[j] > right[i]:
            result.append(right[i])
            i += 1
        else:
            result.append(left[j])
            j += 1

    while j < len(left):
        result.append(left[j])
        j += 1
    while i < len(right):
        result.append(right[i])
        i += 1

    return result

print merge_sort([1,2,45,1,3,4,7,2,1,100,312])
