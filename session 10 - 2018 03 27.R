library(stringr)

# 1. create a character string that contains just one quotation mark: "

print("\"")   # prints the whole thing
cat("\"")     # this works

cat("DSO\n545") # \n puts it on a new line
cat("DSO\t545") # \t is a tab


# 2. create the following in R:   :-\ (^_^")  @_'-' \m/

cat(":-\\")
cat("(^_^\")")
cat("@_'-'")
cat("\\m/")


# 3. search for str_locate() and str_sub()

?str_locate
?str_sub

# 4. locate the character "a" in great, fantastic, and super

str_locate(string = "great", pattern = "a")
str_locate(string = "fantastic", pattern = "a")
str_locate_all("fantastic","a")
str_locate("super","a")

str_locate(c("fantastic","great","super"),
             pattern = "a")

# 5. extract the substrings "tes", "ting", and "test" from "testing"

str_sub("testing", start = 1, end = 3)
str_sub("testing", 4, 7)
str_sub("testing", end = 4)


# 6. what do you think this code is doing?

input <- c("abc", "defg")
str_sub(input, c(2,3))


# 7. use str_locate() to identify the location of the blank 
#     line that separates the header from the body in the 
#     first email (Hint: a blank line is a newline immediately 
#     followed by another newline)

emails <- readRDS("email.rds")

cat(emails[1])

# 8. extract the header and body for the first email.

str_locate(emails[1],"\n\n")      # finds the location of the header/body split (2 blank lines)

header <- str_sub(emails[1], end = 841)
body <- str_sub(emails[1], start = 844)

cat(header)
cat(body)

# 9. split the header of the first email message into tis corresponding metadata (hint, each part of the meta data is on a seperate line.  look for str_split())

str_split



# 10. extract the header and body for all email messages.  store the header and body in header and body variables respectively. 

locations <- str_locate(emails, "\n\n")

headers_all <- str_sub(emails, end = locations[,1])
cat(headers_all)

bodies_all <- str_sub(emails, start = locations[,2])
cat(bodies_all)


### Second lab

# 1. create the following vector of strings in R:

fruit <- c("apple", "banana", "pear", "pineapple")

# 2. run the following lines of code, and try to understand what's happening

str_detect(fruit,"a")   # has an a
str_detect(fruit,"^a")        # starts with a
str_detect(fruit, "a$")       # ends with a
str_detect(fruit, "[aeiou]")  # has any ( [] = or), a or e or i or o or u
str_detect(fruit, "[a-d]")    # has any a through d, a or b or c or d

# 3. using regular expressions write down a line of R code
#     to detect which of the fruits starts with an "a"
#     and ends with an "e".  

str_detect(fruit, "^a[a-z]*e$")   # starts with a, has a-z zero or more times, ends with e
str_detect(fruit, "^a.*e$")       # dot means any character or number, * means any amount of times

# 4. create a parser that detects phone numbers of this format 213 740 4826

str_detect("213 740 4826", "[0-9]{3} [0-9]{3} [0-9]{4}")

# 5. how are phone numbers formatted?  look at the body of messages 10 and 18 in the emails dataset
#     create a parser that detects those formats of phone numbers.

cat(emails[10])
cat(emails[18])

# formats are ###-###-#### and ### ### ####

phone = c("213 740 4826",
          "213-740-4826",
          "(213) 740 4826")

str_detect(phone, "[(]?[0-9]{3}[)]?[- ][0-9]{3}[- ][0-9]{4}")   # [- ] means dash or space


str_extract_all(bodies_all,"[(]?[0-9]{3}[)]?[- ][0-9]{3}[- ][0-9]{4}")
