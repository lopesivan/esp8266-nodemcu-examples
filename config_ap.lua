wifi.setmode(wifi.STATION)
wifi.sta.config("ssid","senha")
dofile("tel.lua")
tmr.alarm(0, 5000, 0, function()
uart.write(0,"\n\r5,")
uart.write(0,wifi.sta.getip())
uart.write(0,";")
 end)
