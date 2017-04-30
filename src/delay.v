/* $Id$ */
/* Copyright (c) 2017 Pierre Pronchery <khorben@defora.org> */
/* This file is part of DeforaOS libFPGA */
/* All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */



`include "system.v"

`ifndef DELAY_TICKS
 `define DELAY_TICKS		(`SYSTEM_CLOCK_HZ / 100)
`endif
//FIXME automatically determine the size needed
`ifndef DELAY_SIZE
 `define DELAY_SIZE		20
`endif
`define DELAY_SIZE_REG(width)	(width - 1)


module delay (
	input wire clk,
	input wire rst,
	input wire en,
	output reg line = 1'b0
);


//variables
reg [`DELAY_SIZE_REG(`DELAY_SIZE):0] delay_cnt = `DELAY_SIZE'b0;


always @(posedge clk)
begin
	if(rst)
	begin
		line <= 1'b0;
		delay_cnt <= `DELAY_SIZE'b0;
	end
	else if(en)
	begin
		delay_cnt <= delay_cnt + `DELAY_SIZE'b1;
		line <= 1'b0;

		if(delay_cnt == `DELAY_TICKS)
		begin
			line <= 1'b1;
			delay_cnt <= `DELAY_SIZE'b0;
		end
	end
end

endmodule
