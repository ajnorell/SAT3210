
usr = "100.0"
if usr.__contains__("."):
        if len(usr.rsplit(".")[-1]) == 1:  
            if len(usr) <= 4:
                print("yes")
            else:
                print("no")
        elif len(usr.rsplit(".")[-1]) == 2:
            if len(usr) <=5:
                print("yes")
            else:
                print("no")
        else:
           print("no")    
elif len(usr) <= 2:
    print("yes")
else:
    print("no")