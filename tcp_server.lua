s=net.createServer(net.TCP)
 s:listen(80,function(c)
 c:on("receive",function(c,pl)
  for v,i in pairs{2,8,9} do
   gpio.mode(i,gpio.OUTPUT)
   c:send("\ngpio("..i.."):"..gpio.read(i))
   if string.find(pl,"gpio"..i.."=0") then gpio.write(i,0) end
   if string.find(pl,"gpio"..i.."=1") then gpio.write(i,1) end
   c:send("\nnew_gpio("..i.."):"..gpio.read(i))
  end
  c:send("\nTMR:"..tmr.now().." MEM:"..node.heap())
 c:on("sent",function(c) c:close() end)
 end)
end)