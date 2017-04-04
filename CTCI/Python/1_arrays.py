def is_unique(string):
    seen = {}
    for c in string:
        if (c in seen):
            return False
        seen[c] = True

    return True

print is_unique("hello") == False
print is_unique("hiewqklm") == True

# ---------------------------------------------------------------------

def is_permutation(str1, str2):
    return ''.join(sorted(str1)) == ''.join(sorted(str2))

print is_permutation("hello", "olehl") == True
print is_permutation("heewewello", "oqwqlehl") == False

def is_permutation2(str1, str2):
    if (len(str1) != len(str2)):
        return False

    count = {}
    idx = 0

    while (idx < len(str1)):
        if (str1[idx] in count):
            count[str1[idx]] += 1
        else:
            count[str1[idx]] = 1

        if (str2[idx] in count):
            count[str2[idx]] -= 1
        else:
            count[str2[idx]] = -1

        idx += 1

    for key in count:
        if (count[key] != 0):
            return False

    return True


print is_permutation2("hello", "olehl") == True
print is_permutation2("heewewello", "oqwqlehl") == False

# ---------------------------------------------------------------------
