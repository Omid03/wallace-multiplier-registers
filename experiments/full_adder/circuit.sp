CA4-2.A
**********************************Libs**********************************
.lib	'../../models/mm018.l'	TT
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
*******************************Half-Adder*******************************
***********Cout bar***********
.SUBCKT HA_C A B S Cout_b

XNAND1  A       B       Cout_b  NAND2
XNAND2  A       Cout_b  n1      NAND2
XNAND3  B       Cout_b  n2      NAND2
XNAND4  n1      n2      S       NAND2

.ENDS HA_C
*************Cout*************
.SUBCKT HA A B S Cout

XHalfAdder A  B  S  Cout_b  HA_C  
XINV    Cout_b  Cout    INV

.ENDS HA
*******************************Full-Adder*******************************
.SUBCKT FA A B C_in S Cout

XHalfAdder1  A      B   n1  n2  HA_C
XHalfAdder2  C_in   n1  S   n3  HA_C
XNAND1  n2  n3  Cout    NAND2  

.ENDS FA
*********************************Circuit********************************
xFA A    B     Cin   S    Cout  FA
*******************************PARAMETERS*******************************
.param  Lmin = 180n
+ Wmin = 220n
+ vd = 1.8V
******************************SIMULATION********************************
.vec    'input.vec'
.op
.measure    tran    tdelay  trig    V(A)   td=60n  val='0.5*vd'    cross=1
+targ   V(S) td=60n  val='0.5*vd'    cross=1
.tran   1p    80n
.print  V(A)    V(B)    V(Cin) V(S)    V(Cout)
.end
.endl