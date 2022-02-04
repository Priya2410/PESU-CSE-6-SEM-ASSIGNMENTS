# Implement a function to access the first and last element print the words as well

# PRIYA MOHATA 
# PES2UG19CS301
# SECTION E - WEEK 1 ASSIGNMENT 

def access_first(arr):
    print(arr[0])

def access_last(arr):
    print(arr[len(arr)-1])

def main():
    arr=['pes university','compiler design','cloud computing','ooad','aiwir','nam']
    access_first(arr)
    access_last(arr)

if __name__=="__main__":
    main() 

