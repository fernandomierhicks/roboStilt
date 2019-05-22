# This is a message that holds extended data of all actuators


# Power supply status constants
uint8 COUNT=8

uint8 THIRD_FRAME_PRISMATIC = 0
uint8 LEG_1 = 1
uint8 LEG_2 = 2
uint8 LEG_3 = 3
uint8 LEG_4 = 4
uint8 LEG_5 = 5
uint8 LEG_6 = 6
uint8 THIRD_FRAME_REVOLUTE = 7

Header header

string[] name
float64[] position
float64[] velocity
float64[] effort
float64[] effort_limit

float64[] position_setpoint
float32[] manipulation
float32[] progress

bool[] is_moving
bool[] is_ready
bool[] has_been_homed
bool[] is_supporting_weight

bool have_all_been_homed
bool all_are_ready


