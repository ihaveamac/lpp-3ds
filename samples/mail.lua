checked = false
timer = false
tmp = Console.new(TOP_SCREEN)
if Network.isWifiEnabled() then
	if Network.sendMail("rinnegatamante@gmail.com","Sample mail with lpp-3ds","This is the body of my sample mail.") then
		Console.append(tmp,"Mail successfully sent!")
	else
		Console.append(tmp,"Error sending mail...")
	end
	checked = true
end
while true do
	if not checked then
		if Network.isWifiEnabled() then
		--Temp Timer for waiting establishing Internet connection
		--It will be substituted nearly with a proper function
			wait = Timer.new()
			checked = true
			timer = true
		end
	elseif timer then
		if Network.isWifiEnabled() then
			if Timer.getTime(wait) >= 8000 then
				if Network.sendMail("rinnegatamante@gmail.com","Sample mail with lpp-3ds","This is the body of my sample mail.") then
					Console.append(tmp,"Mail successfully sent!")
				else
					Console.append(tmp,"Error sending mail...")
				end
				timer = false
			end
		else
			checked = false
		end
	end
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Console.show(tmp)
	Controls.init()
	if Controls.check(Controls.read(),KEY_A) then
		Console.destroy(tmp)
		System.exit()
	end
	Screen.flip()
	Screen.waitVblankStart()
end