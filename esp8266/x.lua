-- function go(pin, t)
--    gpio.write(pin, 1)
--    tmr.alarm(pin, t, function() gpio.write(pin, 0) end)
-- end

-- function tfrwd(t)  go(pin_frwd, t)  end
-- function tback(t)  go(pin_back, t)  end
-- function tleft(t)  go(pin_left, t)  end
-- function tright(t) go(pin_right, t) end

-- local f = function (a) gpio.write(pin_frwd, a)  end
-- local b = function (a) gpio.write(pin_back, a)  end
-- local r = function (a) gpio.write(pin_right, a) end
-- local l = function (a) gpio.write(pin_left, a)  end
-- local delay = tmr.delay

-- program
-- frwd(3000); tmr.delay(500000); right(200); tmr.delay(1000000); left(200);
-- frwd(1); tmr.delay(500*1000)

-- function play()
--    f(1)
--    for i=0, 10 do
--       r(1); tmr.delay(250*1000); r(0); tmr.delay(50*1000);
--    end
--    tmr.delay(400*1000)
--    for i=0, 10 do
--       l(1)
--       tmr.delay(250*1000)
--       l(0)
--       tmr.delay(50*1000)
--    end
--    f(0)
-- end

local play = function ()
   local f = function (a) gpio.write(pin_frwd, a)  end
   local b = function (a) gpio.write(pin_back, a)  end
   local r = function (a) gpio.write(pin_right, a) end
   local l = function (a) gpio.write(pin_left, a)  end
   local delay = tmr.delay

   f(1)
   r(1); delay(250*1000); r(0); delay(50*1000); r(1); delay(250*1000); r(0); delay(50*1000);
   r(1); delay(250*1000); r(0); delay(50*1000); r(1); delay(250*1000); r(0); delay(50*1000);
   r(1); delay(250*1000); r(0); delay(50*1000); r(1); delay(250*1000); r(0); delay(50*1000);
   r(1); delay(250*1000); r(0); delay(50*1000); r(1); delay(250*1000); r(0); delay(50*1000);
   r(1); delay(250*1000); r(0); delay(50*1000); r(1); delay(250*1000); r(0); delay(50*1000);

   l(1); delay(250*1000); l(0); delay(50*1000); l(1); delay(250*1000); l(0); delay(50*1000);
   l(1); delay(250*1000); l(0); delay(50*1000); l(1); delay(250*1000); l(0); delay(50*1000);
   l(1); delay(250*1000); l(0); delay(50*1000); l(1); delay(250*1000); l(0); delay(50*1000);
   l(1); delay(250*1000); l(0); delay(50*1000); l(1); delay(250*1000); l(0); delay(50*1000);
   l(1); delay(250*1000); l(0); delay(50*1000); l(1); delay(250*1000); l(0); delay(50*1000);
   f(0)
end

play()
