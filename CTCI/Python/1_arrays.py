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

def URLify(string):
    string = string.strip()
    return string.replace(" ", "%20")

print URLify("Mr John Smith       ") == "Mr%20John%20Smith"

# ---------------------------------------------------------------------

def palindrome_perm(string):
    count = {}
    for c in string:
        if (c in count):
            count[c] += 1
        else:
            count[c] = 1

    difference = 0

    for key in count:
        if (count[key] % 2 != 0):
            difference += 1
            if (difference > 1):
                return False

    return True

print palindrome_perm("tactcoa") == True
print palindrome_perm("tactcoza") == False

# ---------------------------------------------------------------------

def one_away(str1, str2):
    if (str1 == str2):
        return True
    if (abs(len(str1) - len(str2)) > 1):
        return False

    difference = 0

    if (len(str1) == len(str2)):
        idx = 0
        while idx < len(str1):
            if (str1[idx] != str2[idx]):
                difference += 1
                if difference > 1:
                    return False
            idx += 1
    else:
        shorter = str1 if len(str1) < len(str2) else str2
        longer = str1 if shorter == str2 else str2
        idx1 = 0
        idx2 = 0

        while (idx1 < len(shorter) and idx2 < len(longer)):
            if shorter[idx1] != longer[idx2]:
                if idx1 != idx2:
                    return False
            else:
                idx1 += 1

            idx2 += 1

    return True

print one_away("pale", "ple") == True
print one_away("pales", "pale") == True
print one_away("pale", "bale") == True
print one_away("pale", "bae") == False
print one_away("pale", "pale") == True
print one_away("pale", "pa") == False
print one_away("pale", "jal") == False

# ---------------------------------------------------------------------

def string_compression(string):
    compressed = string[0]

    idx = 1
    count = 1
    while idx < len(string):
        if (string[idx] != compressed[-1]):
            compressed += str(count)
            compressed += string[idx]
            count = 1
        else:
            count += 1
        idx += 1

    compressed += str(count)

    return compressed if len(compressed) < len(string) else string

print string_compression("aabcccccaaa") == "a2b1c5a3"
print string_compression("aabccccca") == "a2b1c5a1"
print string_compression("aabbcc") == "aabbcc"

# ---------------------------------------------------------------------
