f = require 'fb'
l = require 'lvgl'

sprintf = string.format
c = {0, 0};

--- tela 1 ---
scr1 = l.obj_create()

sli = l.slider_create(scr1)
sli:obj_center()

sli:on_changed(function(code)
	local v = sli:slider_get_value()
	if (not v) then return; end
	
	lbl:label_set_text( sprintf('%d%%', v) )
end);

lbl = l.label_create(scr1)
lbl:obj_align_to(sli, l.LV_ALIGN_OUT_BOTTOM_MID, 0, 10);
lbl:label_set_text( '' )

--- select screen ---
l.screen_load(scr1)

while(true) do
	if (not f.update()) then break; end
	
	l.task_handler();
	f.sync();	
end

print(_VERSION)
