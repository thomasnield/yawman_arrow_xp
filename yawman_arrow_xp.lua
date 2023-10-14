function set_axis_assignments()
    set_axis_assignment(0, "Roll", "normal" )
    set_axis_assignment(1, "Pitch", "normal" )
    set_axis_assignment(4, "Yaw", "normal" )
    set_axis_assignment(5, "Throttle", "reverse" )
    set_axis_assignment(6, "Flaps", "normal" )
end 

--[[
How buttons are assigned numbers in XP are cryptic. 
But you can use button_sniffer.lua to find the button numbers by pressing each one on the controller
https://github.com/X-Friese/FlyWithLua/blob/master/FlyWithLua/Internals/button_sniffer.lua
--]]

POV_UP = 0
POV_RIGHT = 2
POV_DOWN = 4
POV_LEFT = 6
THUMBSTICK_CLK = 8
SIXPACK_1 = 9
SIXPACK_2 = 10
SIXPACK_3 = 11
SIXPACK_4 = 12
SIXPACK_5 = 13
SIXPACK_6 = 14
POV_CENTER = 15
RIGHT_BUMPER = 16
DPAD_CENTER = 17
LEFT_BUMPER = 18
WHEEL_DOWN = 19
WHEEL_UP = 20
DPAD_UP = 21
DPAD_LEFT = 22
DPAD_DOWN = 23
DPAD_RIGHT = 24

function button_event_handler() 

    -- these are modifiers 
    left_bumper = button(LEFT_BUMPER)
    right_bumper = button(RIGHT_BUMPER)
    dpad_up = button(DPAD_UP)
    sixpack_1 = button(SIXPACK_1)
    sixpack_3 = button(SIXPACK_3)

    -- these are commands, including modified ones 
    if left_bumper then 
        set_button_assignment(RIGHT_BUMPER, "sim/flight_controls/brakes_toggle_max")        

        set_button_assignment(DPAD_LEFT, "sim/autopilot/heading_down")
        set_button_assignment(DPAD_RIGHT, "sim/autopilot/heading_up")
        
    elseif right_bumper then 
        set_button_assignment(SIXPACK_1, "sim/autopilot/level_change") -- airspeed hold 
        set_button_assignment(SIXPACK_2, "sim/autopilot/fdir_toggle")
        set_button_assignment(SIXPACK_3, "sim/autopilot/altitude_hold")
        set_button_assignment(SIXPACK_5, "sim/autopilot/heading_hold")
        set_button_assignment(SIXPACK_6, "sim/autopilot/vertical_speed")

    elseif dpad_up then 
        set_button_assignment(POV_LEFT, "sim/view/quick_look_8")
        set_button_assignment(POV_RIGHT, "sim/view/quick_look_7")

        set_button_assignment(WHEEL_DOWN, "sim/flight_controls/flaps_up")
        set_button_assignment(WHEEL_UP, "sim/flight_controls/flaps_down") 
        
    -- non-modified commands go here 
    else
        set_button_assignment(WHEEL_DOWN, "sim/flight_controls/pitch_trim_down")
        set_button_assignment(WHEEL_UP, "sim/flight_controls/pitch_trim_up")


        set_button_assignment(RIGHT_BUMPER, "sim/none/none")
    end 
   
end 

function set_up_yawman_arrow() 

end 

clear_all_axis_assignments()
clear_all_button_assignments()
--set_axis_assignments()
do_every_draw("button_event_handler()")


add_macro("Initialize Arrow Multipress", "set_up_yawman_arrow()")

--[[
if (PLANE_ICAO == "C172") then
    set("sim/joystick/joystick_pitch_nullzone", 0.1)
    set("sim/joystick/joystick_roll_nullzone", 0.1)
elseif (PLANE_ICAO == "B738") then 
    set("sim/joystick/joystick_pitch_nullzone", 0.2)
    set("sim/joystick/joystick_roll_nullzone", 0.2)
end 

DataRef("is_external", "sim/graphics/view/view_is_external", "readonly")

if is_external == 1 then 
    set_button_assignment(SIXPACK_1, "sim/view/default_view")
else
    set_button_assignment(SIXPACK_1, "sim/view/chase")
end 
    
--]]
