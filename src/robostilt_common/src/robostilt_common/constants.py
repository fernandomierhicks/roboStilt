# CONSTANTS
class frame:
    none=0
    third_prismatic=1
    even=2
    odd=3
    third_revolute=4

class actuator:
    third_frame_prismatic=0
    leg_1=1
    leg_2=2
    leg_3=3
    leg_4=4
    leg_5=5
    leg_6=6
    third_frame_revolute=7


JointName = {
    0: "third_frame_prismatic",
    1: "leg_1",
    2: "leg_2",
    3: "leg_3",
    4: "leg_4",
    5: "leg_5",
    6: "leg_6",
    7: "third_frame_revolute"
}

def getActuatorIndexFromFrame(selectedFrame):
    if(selectedFrame==frame.even):
        return [2,4,6]
    elif (selectedFrame==frame.odd):
        return [1,3,5]
    elif (selectedFrame==frame.third_prismatic):
        return [0]
    elif (selectedFrame==frame.third_revolute):
        return [7]
    elif (selectedFrame==frame.none):
        return []
    else:
        return []



