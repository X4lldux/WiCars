local M={}


local broker_ip="192.168.0.10"
local client_id=car_name
local topic=client_id

local m = mqtt.Client(client_id, 120, "", "")


function M.connect()
   m:on("offline", function(con) print ("disconnected from mqtt broker") end)
   m:on("message", mqtt_on_message)

   m:connect(broker_ip, 1883, 0, function(conn)
                print ("connected to mqtt broker")
                m:subscribe(topic, 0, mqtt_subscribed)
   end)
end

local function mqtt_subscribed(conn)
   m:publish(topic, "hello", 0, 0)
end

local function mqtt_on_message(conn, topic, data)
   print(topic)
   print(data)
   local cmd=data:sub(1, 1)
   local step=ronumber(data:sub(2))

   if     cmd == "q" then fl(step)
   elseif cmd == "w" then  f(step)
   elseif cmd == "e" then fr(step)
   elseif cmd == "a" then  l(step)
   elseif cmd == "s" then  b(step)
   elseif cmd == "d" then  r(step)
   elseif cmd == "z" then bl(step)
   elseif cmd == "c" then br(step)
   end
end

return M
