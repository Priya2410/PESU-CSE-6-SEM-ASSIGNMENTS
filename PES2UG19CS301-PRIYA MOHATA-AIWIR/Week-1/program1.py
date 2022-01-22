# WAP to count word frequency in a text file

# PRIYA MOHATA 
# PES2UG19CS301
# SECTION E - WEEK 1 ASSIGNMENT 

def main():

    f=open('sample.txt','r')
    print('Enter your word')
    word=input()

    freq_word=0
    for line in f.readlines():
       line=line.split('\n')[0].split()
       freq_word=freq_word+line.count(word)
    
    print('The frequency of',word,'is:',freq_word)   
    f.close() 

if __name__=="__main__":
    main()  
