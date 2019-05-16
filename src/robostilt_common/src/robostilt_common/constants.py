# CONSTANTS










class single_frame: #single frame
    name=None
    actuatorIndexes=[]

    def __init__(self, name, actuatorIndexes):
        self.name=name
        self.actuatorIndexes=actuatorIndexes

class single_actuator: #single frame
    name=None
    index=None

    def __init__(self, name, index):
        self.name=name
        self.index=index


class frame_list:  
    EVEN=single_frame("even",[2,4,6])
    ODD=single_frame("odd",[1,3,5])
    EVEN_AND_ODD=single_frame("even_and_odd",[1,2,3,4,5,6])
    THIRD_FRAME_PRISMATIC=single_frame("third_frame_prismatic",[0])
    THIRD_FRAME_REVOLUTE=single_frame("third_frame_revolute",[7])
    NONE=single_frame("none",[])

class actuator_list:
    count=8  
    third_frame_prismatic=single_actuator("third_frame_prismatic",0)
    leg_1=single_actuator("leg_1",1)
    leg_2=single_actuator("leg_2",2)
    leg_3=single_actuator("leg_3",3)
    leg_4=single_actuator("leg_4",4)
    leg_5=single_actuator("leg_5",5)
    leg_6=single_actuator("leg_6",6)
    third_frame_revolute=single_actuator("third_frame_revolute",7)


    def getNameFromIndex(self, index):
        name = {
            0: "third_frame_prismatic",
            1: "leg_1",
            2: "leg_2",
            3: "leg_3",
            4: "leg_4",
            5: "leg_5",
            6: "leg_6",
            7: "third_frame_revolute"
        }
        return name.get(index)
        



class constants:
    FRAME=frame_list()
    ACTUATOR=actuator_list()












