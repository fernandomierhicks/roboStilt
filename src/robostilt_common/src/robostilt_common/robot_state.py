#! /usr/bin/env python
from std_srvs.srv import EmptyResponse
from std_srvs.srv import Empty
from robostilt_common.msg import RoboStiltStateMessage
from constants import constants as C
import parameters as p
from geometry_msgs.msg import QuaternionStamped
import functions as f
import tf
import actuators_state
from std_srvs.srv import Empty
import roslib
roslib.load_manifest('std_srvs')


class robot_state:
    actuators = None
    supportingFrame = C.FRAME.NONE
    publisher = None
    roll_x = None
    pitch_y = None
    yaw_z = None
    rate = None
    service_stop = None
    service_set_initial_state = None

    def __init__(self):
        f.print_ros("Robot_state setup started")
        # start robot_state node and topic publisher
        self.publisher = rospy.Publisher(
            '/robostilt/general_state_topic', RoboStiltStateMessage, queue_size=1, latch=True)
            '/robostilt/general_state_topic', RoboStiltStateMessage, queue_size = 1, latch = True)
        rospy.Subscriber("/robostilt/safety/level",
                         QuaternionStamped, self._level_callback)

        self.service_stop=rospy.Service(
            'robostilt_state/stop_all_motors', Empty, self.stop_all_motors)
        self.service_set_initial_state=rospy.Service(
            'robostilt_state/set_inital_state', Empty, self.set_initial_state_service)
        self.rate=rospy.Rate(50)
        self.actuators=actuators_state.actuators_state()
        p.read_from_parameter_server()
            'robostilt_state/set_inital_state', Empty, self.set_initial_state_service)
        self.rate=rospy.Rate(50)
        self.actuators=actuators_state.actuators_state()
        orientation_q=msg.quaternion
        # Calculate euler angles
        orientation_list=[orientation_q.x,
                            orientation_q.y, orientation_q.z, orientation_q.w]
        (self.roll_x, self.pitch_y,
         self.yaw_z)=tf.transformations.euler_from_quaternion(orientation_list)
        # rospy.loginfo(self.roll_x)
        # Calculate euler angles
        orientation_list=[orientation_q.x,
        # service req is empty
        for i in range(0, C.ACTUATOR.count):
            self.actuators.actuator[i].motor.stop()
        return EmptyResponse()

    def raise_frame_while_leveling(self, position):
        # move lonely leg normally, leg_2 or leg_5. Move other legs to their max displacement, will abort once lonely leg reaches goal
        frame=C.FRAME.EVEN
        f.print_ros("Raising frame " + frame.name +
                    " to position " + str(position) + " ...")
        indexes=frame.actuatorIndexes
        speed=0.1
        level_thereshold=0.0174533

        for i in indexes:
        speed=0.1
        level_thereshold=0.0174533
        if(frame.name == C.FRAME.EVEN.name):
            lonely_leg=2

        self.actuators.actuator[lonely_leg].motor.set_position(position, speed)

        self.actuators.actuator[4].motor.set_position(-2.0, speed)
        self.actuators.actuator[6].motor.set_position(-2.0, speed)

        while(self.actuators.have_all_actuators_reached_goal() == False):
        self.actuators.actuator[4].motor.set_position(-2.0, speed)
        self.actuators.actuator[6].motor.set_position(-2.0, speed)

        while(self.actuators.have_all_actuators_reached_goal() == False):
            if(self.roll_x > level_thereshold):
                self.actuators.actuator[6].motor.set_position(-2.0, speed*0.5)
                f.print_ros("reducing speed")
            elif(self.roll_x < -1*level_thereshold):
                self.actuators.actuator[6].motor.set_position(-2.0, speed*1.5)
                self.actuators.actuator[6].motor.set_position(-2.0, speed*0.5)
                f.print_ros("reducing speed")
                self.actuators.actuator[6].motor.set_position(-2.0, speed)
                self.actuators.actuator[6].motor.set_position(-2.0, speed*1.5)
                f.print_ros("Increasing speed")
            # check if lonely leg is done
            if (self.actuators.actuator[2].motor.has_reached_goal == True):
                f.print_ros("normal speed")

            # check if lonely leg is done
                break
        self.actuators.wait_for_all_actuators_to_finish()

    def lower_legs_on_frame(self, frame, limited_effort):
        f.print_ros("Lowering legs on frame " + frame.name + " to position " + str(
            p.dimension.nominal_walking_height) + " with effort_limit= " + str(limited_effort) + " ...")

        indexes=frame.actuatorIndexes
        for i in indexes:
            if(limited_effort == True):
                self.actuators.actuator[i].motor.set_effort_limits(
                    p.effort.lowering_leg_min, p.effort.lowering_leg_max)
        indexes=frame.actuatorIndexes
        for i in indexes:
            self.actuators.actuator[i].motor.set_position(
                p.dimension.nominal_walking_height, p.speed.lowering_legs)
        self.actuators.wait_for_all_actuators_to_finish()

        # We are now supported by this frame
        self.supportingFrame = frame
        for i in indexes:
            self.actuators.actuator[i].is_supporting = True

        # update supporting legs topic
        # We are now supported by this frame
        self.supportingFrame = frame
        f.print_ros("Lowering legs on frame " + frame.name + " to position " + str(
            p.dimension.nominal_walking_height) + " with effort_limit= " + str(limited_effort) + " COMPLETED")
        # update supporting legs topic
        self.update_robot_state_topic()
        f.print_ros("Raising legs on frame " + frame.name +
                    " to position 0.0 with effort_limit=max...")
        indexes = frame.actuatorIndexes
        for i in indexes:
            self.actuators.actuator[i].motor.set_effort_limits_to_max()
            self.actuators.actuator[i].motor.set_position(
                0.0, p.speed.raising_legs)
            self.actuators.actuator[i].is_supporting = False

        # We are NOT supported by this frame at this time
        # update supporting legs topic
            self.actuators.actuator[i].motor.set_effort_limits_to_max()
            self.actuators.actuator[i].motor.set_position(
                0.0, p.speed.raising_legs)
        f.print_ros("Raising legs on frame " + frame.name +
                    " to position 0 with effort_limit=max COMPLETED")

    def move_prismatic(self, position):
        f.print_ros("Moving third frame Prismatic to " + str(position) + "...")
        i = C.ACTUATOR.third_frame_prismatic.index
        self.actuators.actuator[i].motor.set_effort_limits_to_max()
        self.actuators.actuator[i].motor.set_position(
            position, p.speed.prismatic)
        self.actuators.wait_for_all_actuators_to_finish()
        f.print_ros("Moving third frame Prismatic to " +
                    str(position) + " COMPLETED")

    def move_actuator(self, actuator_index, position):
        f.print_ros("Moving "+str(C.ACTUATOR.getNameFromIndex(actuator_index)
                                  )+"  to " + str(position) + "...")
        i = actuator_index
        self.actuators.actuator[i].motor.set_effort_limits_to_max()
        self.actuators.actuator[i].motor.set_position(
            position, p.speed.lowering_legs)
        self.actuators.wait_for_all_actuators_to_finish()
        f.print_ros("Moving "+str(C.ACTUATOR.getNameFromIndex(actuator_index)
                                  )+"  to " + str(position) + "COMPLETED")


    def move_actuator(self, actuator_index, position):
        msg.header.stamp = rospy.Time.now()
        msg.name = []
        msg.is_supporting = []
        for i in range(0, C.ACTUATOR.count):
        self.actuators.actuator[i].motor.set_position(
            msg.is_supporting.append(self.actuators.actuator[i].is_supporting)
        self.actuators.wait_for_all_actuators_to_finish()
        f.print_ros("Moving "+str(C.ACTUATOR.getNameFromIndex(actuator_index)
                                  )+"  to " + str(position) + "COMPLETED")
        # Move Forward
    def update_robot_state_topic(self):
        msg = RoboStiltStateMessage()

        # Lower legs on ODD
        f.wait_for_user()
        self.lower_legs_on_frame(C.FRAME.ODD, True)

        # Raise legs on even
        f.wait_for_user()


        # Move Forward
        f.wait_for_user()
        self.move_prismatic(-0.5)

        # Lower legs on EVEN
        f.wait_for_user()
        self.lower_legs_on_frame(C.FRAME.EVEN, True)

        # Raise legs on ODD
        f.wait_for_user()
        self.raise_legs_on_frame(C.FRAME.EVEN)

        f.wait_for_user()
        # service request is empty
        f.print_ros(
            "Initializing position. All legs raised prismatic to -0.2...")
        f.wait_for_user()
        self.raise_legs_on_frame(C.FRAME.EVEN_AND_ODD)
        self.move_prismatic(-0.2)
        self.actuators.wait_for_all_actuators_to_finish()
        f.print_ros("Initial position COMPLETED")

    def set_initial_state_service(self, req):
        self.set_initial_state()
        return EmptyResponse()
        self.raise_legs_on_frame(C.FRAME.EVEN_AND_ODD)
        self.move_prismatic(-0.2)
        self.actuators.wait_for_all_actuators_to_finish()
        f.print_ros("Initial position COMPLETED")

    def set_initial_state_service(self, req):
        self.set_initial_state()
        return EmptyResponse()
