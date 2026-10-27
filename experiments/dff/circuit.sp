CA4-1.B
**********************************Libs**********************************
.lib	'../../models/mm018.l'	TT
***********************************CLK**********************************
VCLK    clk 0   PULSE   0   vd  0   0   0   5n   10n
*********************************Inverter*******************************
.SUBCKT	INV	in out

Vsupply	Vdin	GND	vd

M1      out     in      GND		GND		nmos	    L=Lmin	    W=Wmin
M2      out     in      Vdin	Vdin	pmos	    L=Lmin	    W='2*Wmin'

.ENDS INV
**********************************NAND2*********************************
.SUBCKT NAND2 in1 in2 out

Vsupply Vdin GND vd

M1      out   in1     n1      GND     nmos     L=Lmin      W='2*Wmin'
M2      n1    in2     GND     GND     nmos     L=Lmin      W='2*Wmin'
M3      out   in1     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'
M4      out   in2     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'

.ENDS NAND2
**********************************D-Latch*********************************
.SUBCKT D_Latch D E out

XINV2   D       D_bar   INV

XNAND1  D       E       n1      NAND2
XNAND2  D_bar   E       n2      NAND2
XNAND3  n1      out_b   out     NAND2
XNAND4  n2      out     out_b   NAND2

.ENDS D_Latch
********************************D-FlipFlop*******************************
.SUBCKT D_FlipFlop D clk out

XINV1   clk     clk_b   INV
XINV2   clk_b   clk_bb  INV

XD_L1   D       clk_b   n1      D_Latch
XD_L2   n1      clk_bb  out     D_Latch

.ENDS D_FlipFlop
********************************Circuit*******************************
XTest D     clk     out    D_FlipFlop
*******************************PARAMETERS*******************************
.param  Lmin = 180n
+ Wmin = 220n
+ vd = 1.8V
******************************SIMULATION********************************
.VEC "input.vec"
.op
.tran 1p    20n
.print V(D) V(clk)  V(out)
.end
.endl