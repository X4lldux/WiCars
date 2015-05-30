function f (t) gpio.write(pin_frwd, 1); tmr.delay(t*1000);  gpio.write(pin_frwd, 0); end
function b (t) gpio.write(pin_back, 1); tmr.delay(t*1000);  gpio.write(pin_back, 0); end
function r (t) gpio.write(pin_right, 1); tmr.delay(t*1000); gpio.write(pin_right, 0); end
function l (t) gpio.write(pin_left, 1); tmr.delay(t*1000);  gpio.write(pin_left, 0); end
function fl (t)
   gpio.write(pin_frwd, 1); gpio.write(pin_left, 1);
   tmr.delay(t*1000);
   gpio.write(pin_frwd, 0); gpio.write(pin_left, 0);
end
function bl (t)
   gpio.write(pin_back, 1); gpio.write(pin_left, 1);
   tmr.delay(t*1000);
   gpio.write(pin_back, 0); gpio.write(pin_left, 0);
end
function fr (t)
   gpio.write(pin_frwd, 1); gpio.write(pin_right, 1);
   tmr.delay(t*1000);
   gpio.write(pin_frwd, 0); gpio.write(pin_right, 0);
end
function br (t)
   gpio.write(pin_back, 1); gpio.write(pin_right, 1);
   tmr.delay(t*1000);
   gpio.write(pin_back, 0); gpio.write(pin_right, 0);
end
