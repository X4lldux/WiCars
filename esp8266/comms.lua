local ap_file="ap.list"

file.open(ap_file)
local ap=string.sub(file.readline(), 1, -2)
local pass=string.sub(file.readline(), 1, -2)
file.close()

wifi.setmode(wifi.STATION)
wifi.sta.config(ap, pass)
wifi.sta.connect()

tmr.alarm(0, 1000, 1, function()
             local ip=wifi.sta.getip()
             if ip == nil  then
                print("Connecting to AP, Waiting...")
             else
                tmr.stop(0)
                print("CONNECTED! "..ip)

                msger.connect()
             end

end)
print("Will be connecting to AP soon...")
