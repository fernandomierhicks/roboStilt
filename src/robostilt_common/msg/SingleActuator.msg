# This is a message that holds extended data for a single actuator

string  name
int32   index

float64 position
float64 position_setpoint   #trajectorized setpoint TODO
float64 position_goal       #long term goal

float64 velocity
float64 velocity_setpoint   #trajectorized velocity TODO

float64 effort
float64 effort_limit_upper
float64 effort_limit_lower
float64 effort_fault_expected


float32 manipulation
float32 progress

bool is_moving
bool is_ready
bool has_been_homed
bool is_supporting_weight





