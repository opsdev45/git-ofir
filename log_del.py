import os, sys, datetime


max_date = 100
path = "C:\logtest"
today = datetime.datetime.now()

try: 
    for file in os.listdir(path):
        file_path=os.path.join(path, file)
        file_date = datetime.datetime.fromtimestamp(os.path.getctime(file_path))
        print(file)
        num = (today - file_date).seconds
        extension = os.path.splitext(file)
        
        if extension[1] == ".txt":
            if num > max_date:
                if os.path.isfile(file_path):
                    print("delete this file:" + file)
                    #os.remove(file_path)
                
            #print(file + "  seconds:" + str(num))

except OSError:
    print("Path '%s' does not exists or is inaccessible" %path)
