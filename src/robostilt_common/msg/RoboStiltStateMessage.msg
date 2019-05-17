# This is a message that holds data abou the general state of the robo
#
# name holds the name of each leg
# is_supporting=true when that leg is currenlty supporting weight of the robot. Otherwise its false
#
# Each leg is uniquely identified by its name
# The header specifies the time at which the leg states were recorded. All the leg states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the leg state. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.

Header header

string[] name
bool[] is_supporting