def is_unique(string):
    seen = {}
    for c in string:
        if (c in seen):
            return False
        seen[c] = True

    return True

print is_unique("hello") == False
print is_unique("hiewqklm") == True
