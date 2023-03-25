PROJ=blink
TRELLIS?=/usr/share/trellis
TOPMODULE=top


all: ${PROJ}.bit

%.json: %.v
	yosys -p "synth_ecp5 -top ${TOPMODULE} -json $@" $<

%_out.config: %.json
	nextpnr-ecp5 --json $< --textcfg $@ --25k --package CABGA256 --lpf blink.lpf

%.bit: %_out.config
	ecppack --svf ${PROJ}.svf $< $@  

${PROJ}.svf : ${PROJ}.bit

prog: ${PROJ}.svf
	openocd -f colorlight_5a75b.cfg -c "svf -quiet -progress $<; exit"

clean:
	rm -f *.svf *.bit *.config *.json

.PHONY: prog clean
