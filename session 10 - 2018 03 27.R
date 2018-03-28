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
