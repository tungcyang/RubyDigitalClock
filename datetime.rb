# This is a Ruby script file to print current time in ASCII art.

# Defining constants
ASCIIART_HEIGHT = 7
ASCIIART_WIDth = 9

# Defining ASCII characters.  Here we would like to create the ASCII
# representation for each possible character in our display.  Note that
# each ASCII needs to be an array of strings, with the array size being
# ASCIIART_HEIGHT and the string length being ASCIIART_WIDTH.
one =    ["        1", "        1", "        1", "        1", "        1", "        1", "        1"]
two =    ["222222222", "        2", "        2", "222222222", "2        ", "2        ", "222222222"]
three =  ["333333333", "        3", "        3", "333333333", "        3", "        3", "333333333"]
four =   ["4       4", "4       4", "4       4", "444444444", "        4", "        4", "        4"]
five =   ["555555555", "5        ", "5        ", "555555555", "        5", "        5", "555555555"]
six =    ["666666666", "6        ", "6        ", "666666666", "6       6", "6       6", "666666666"]
seven =  ["777777777", "        7", "        7", "        7", "        7", "        7", "        7"]
eight =  ["888888888", "8       8", "8       8", "888888888", "8       8", "8       8", "888888888"]
nine =   ["999999999", "9       9", "9       9", "999999999", "        9", "        9", "        9"]
zero =   ["000000000", "0       0", "0       0", "0       0", "0       0", "0       0", "000000000"]
space =  ["         ", "         ", "         ", "         ", "         ", "         ", "         "]
colon =  ["         ", "         ", "    :    ", "         ", "    :    ", "         ", "         "]
A =      ["    A    ", "   A A   ", "  A   A  ", " A     A ", "AAAAAAAAA", "A       A", "A       A"]
P =      ["PPPPPPPP ", "P       P", "P       P", "PPPPPPPP ", "P        ", "P        ", "P        "]
M =      ["M       M", "MM     MM", "M M   M M", "M  M M  M", "M   M   M", "M       M", "M       M"]

require "date"
currentTime = DateTime.now

# We have the current time.  Decide if it is in the morning or afternoon/evening.

hour = currentTime.hour
minute = currentTime.minute
second = currentTime.second
if hour >= 12 then
    meridiem = "PM"
    # We would like to present the time as 12-hour clock format
    hour = hour % 12
    if hour == 0
        hour = 12
    end
else
    meridiem = "AM"
end

# We have the hour, minute and second information.  Time to assemble everything
# into ASCII art.  Note that we need to add leading 0's as appropriate.

hourStr = hour.to_s
minuteStr = minute.to_s
secondStr = second.to_s
if (hour < 10) then
    hourStr = "0" + hourStr
end
if (minute < 10) then
    minuteStr = "0" + minuteStr
end
if (second < 10) then
    secondStr = "0" + secondStr
end
asciiArtStr = hourStr + ":" + minuteStr + ":" + secondStr + " " + meridiem.to_s;

# Now we already formed the string to print.  Convert it into ASCII art form and print.

0.upto(ASCIIART_HEIGHT) do |asciiArtStrRowIndex|
    asciiArtStr.each_char do |asciiArtChar|
        print case asciiArtChar
        when '0'
             print zero[asciiArtStrRowIndex]
        when '1'
             print one[asciiArtStrRowIndex]
        when '2'
             print two[asciiArtStrRowIndex]
        when '3'
             print three[asciiArtStrRowIndex]
        when '4'
             print four[asciiArtStrRowIndex]
        when '5'
             print five[asciiArtStrRowIndex]
        when '6'
             print six[asciiArtStrRowIndex]
        when '7'
             print seven[asciiArtStrRowIndex]
        when '8'
             print eight[asciiArtStrRowIndex]
        when '9'
             print nine[asciiArtStrRowIndex]
        when ':'
             print colon[asciiArtStrRowIndex]
        when ' '
             print space[asciiArtStrRowIndex]
        when 'A'
             print A[asciiArtStrRowIndex]
        when 'P'
             print P[asciiArtStrRowIndex]
        when 'M'
             print M[asciiArtStrRowIndex]
        else
             # It will be prettier to make the string length as ASCIIART_WIDTH
             print "   ERROR!"
        end
        # Putting a gap as the space between characters
        print " "
    end
    # Working on the next line
    print "\n"
end

