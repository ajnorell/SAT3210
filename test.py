array = [[1,2,3],[4,5,6],[7,8,9]]
key = 10
global var
var = "F"
for i in array:
    if var == "F":
        for j, entry in enumerate(i):
            if key == entry:
                var
                var = "T"
                break
            else:
                var = "F"
    else:
        break
        
print(var)