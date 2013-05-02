Ruby Cal Program
================

This is a Ruby project for the Nashville Software School. The goal is to create a Ruby program that mimics the 
functionality of the command line program cal.

Phase 1
--

Created integration tests that will compare the final output of my program against cal.
https://github.com/Brandon-Lyons/Ruby-Calendar/blob/master/test/test_cal_integration.rb

Phase 2
--

Created unit tests to go along with the TDD mentality of this project.
https://github.com/Brandon-Lyons/Ruby-Calendar/blob/master/test/test_cal.rb

Phase 3
--

Created methods that pass my unit tests and eventually reach the goal of cal like output.

Phase 4
--

Ran integration tests to compare the output to cal.

Phase 5
--

Created unit and integration tests to add ability to display entire year if year is the only argument passed.
Also add ability to display month if name of month is passed instead of an integer.
Please note that at this time it will only recognize integers or the name of the month spelled out fully and correctly.
I will put in ability to allow abbreviated names (such as jan or feb) at a later time.

Phase 6
--

Completed early version of final program.
It will accept the month and year and display that month only.
It will also accept just the year and will display the entire calendar for that year.

Phase 7
--

Currently refactoring code. 



Eliza, please note that this output was made to pass compared to cal run in terminal on a Mac. I have tried these integration tests in Ubuntu and they have failed due to the fact that Ubuntu's version of cal adds trailing whitespaces to the end of every line including empty lines. Apple's cal has no trailing whitespaces and makes refactoring much easier.
