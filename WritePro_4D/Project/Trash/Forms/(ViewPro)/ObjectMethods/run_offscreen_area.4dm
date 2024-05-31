//run_offscreen_area (ko)

$file_t:=Get 4D folder(Database folder)+"documentView.4VP"

$o:=cs.OffscreenArea.new()

$result:=VP Run offscreen area($o)