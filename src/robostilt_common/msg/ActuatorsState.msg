# This is a message that holds the state of all actuators as an array.

uint8 COUNT=8
uint8 THIRD_FRAME_PRISMATIC = 0
uint8 LEG_1 = 1
uint8 LEG_2 = 2
uint8 LEG_3 = 3
uint8 LEG_4 = 4
uint8 LEG_5 = 5
uint8 LEG_6 = 6
uint8 THIRD_FRAME_REVOLUTE = 7

bool ABS=True
bool REL=False


Header header

SingleActuator[] actuators
bool have_all_been_homed
bool all_are_ready