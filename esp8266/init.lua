-- reset pins
pin_frwd=1                      -- gpio4
pin_back=2                      -- gpio5
pin_left=0                      -- gpio16
pin_right=5                     -- gpio15

gpio.mode(pin_right, gpio.OUTPUT)
gpio.write(pin_right, gpio.LOW)

gpio.mode(pin_frwd,  gpio.OUTPUT)
gpio.write(pin_frwd, gpio.LOW)

gpio.mode(pin_back,  gpio.OUTPUT)
gpio.write(pin_back, gpio.LOW)

gpio.mode(pin_left,  gpio.OUTPUT)
gpio.write(pin_left, gpio.LOW)



-- init

car_name="wicar0"

require "controller"
msger=require "messenger"
require "comms"
