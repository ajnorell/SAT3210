array = [[0,2,3],[4,5,6],[7,8,9],[10,11,1]]
key = 1
global var
var = "F"
for i in array:
    if var == "F":
        for j, entry in enumerate(i):
            if key == entry:
                var = "T"
                print(key)
                break
            else:
                var = "F"
    else:
        break
        
print(var)