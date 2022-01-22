# WAP - take an array and store the words in the array
# Implement searching [ wrt a particular word , check if it exists or not , return its index ]

# PRIYA MOHATA 
# PES2UG19CS301
# SECTION E - WEEK 1 ASSIGNMENT 


def main():
    arr=['pes university','compiler design','cloud computing','ooad','aiwir','nam']
    print("Enter the word to be searched")
    word=input()
    pos=-1
    for i in range(0,len(arr)):
        if word==arr[i]:
            pos=i;
    if(pos==-1):
        print("Element not found!")
    else:
        print("Element found at position:",pos)

if __name__=="__main__":
    main() 

