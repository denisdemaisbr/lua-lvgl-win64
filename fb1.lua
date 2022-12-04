f = require 'fb'

f.clear(0xffffff)

for i=1, 5 do
f.draw_rectangle( 10+i, 10+i, 100-i, 100-i, 0xff00ff );
end

f.draw_circle( 90, 90, 50, 0x00ff00 );

for i=1, 25 do
f.draw_line( 10, 10, 100+i, 100-i, 0xff0000 );
end



while(true) do
	if (not f.update()) then break; end
	
	f.sync();	
end

print(_VERSION)
