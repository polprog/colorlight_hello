Colorlight 5A-75B basic example
===

This repository contains a very basic example project for the Colorlight 5A-75B FPGA board.
It uses [Yosys](https://github.com/YosysHQ/) to compile Verilog for the ECP5 FPGA.

See the two part introduction post on YosysHQ blog: [part 1](https://blog.yosyshq.com/p/colorlight-part-1/), [part 2]()

Compilation and upload
---

To build the bitstream, use the provided Makefile

    make
	
There is a `prog` target which assumes you have a JLink and uses OpenOCD to load the bitstream to the FPGA memory. If you are using a different adapter, please edit the `colorlight_5a75b.cfg` file to your taste.

You can then upload the bitstream with

	make prog


A known good bitfile is provided for your conveinience to test your setup.
