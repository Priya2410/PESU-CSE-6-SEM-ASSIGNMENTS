# Insert an element at the end of the array and traverse the array 

# PRIYA MOHATA 
# PES2UG19CS301
# SECTION E - WEEK 1 ASSIGNMENT 

def main():
    arr=['pes university','compiler design','cloud computing','ooad','aiwir','nam']
    print("Enter the word to be inserted")
    word=input()

    arr.append(word)

    for i in arr:
        print(i,end=' ')

if __name__=="__main__":
    main() 
