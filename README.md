DeforaOS libFPGA
================

About DeforaOS libFPGA
----------------------

The goal of this project is to provide a database of consistent, hassle-free
building blocks for FPGA targets.

In the current, very early phase the focus is first on a sustainable work
environment, ideally relying on Open Source tools for simulating, testing,
building and flashing programs. The code provided here is therefore very
limited, and not guaranteed to be correct.


Compiling DeforaOS libFPGA
--------------------------

Simply running `make` with no argument should be enough to build DeforaOS
libFPGA on your platform:

    $ make

_Warning_: the Makefiles generated so far are missing the `VERILOG` variable,
           expected to determine the compiler to use. To build with Icarus
           Verilog, please therefore call:

    $ make VERILOG="iverilog"


Generating Makefiles
--------------------

Official releases of DeforaOS libFPGA ship with Makefiles. The Makefiles are
generated with `configure(1)` from the DeforaOS configure project, found at
<https://www.defora.org/os/project/16/configure>.
