CA4-2.B
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
**********************************AND2*********************************
.SUBCKT AND2 in1 in2 out

XNAND   in1 in2 out_b NAND2
XINV    out_b   out INV

.ENDS AND2
**********************************AND3*********************************
.SUBCKT AND3 in1 in2 in3 out


Vsupply Vdin GND vd

M1      out_b   in1     n1      GND     nmos     L=Lmin      W='3*Wmin'
M2      n1      in2     n2      GND     nmos     L=Lmin      W='3*Wmin'
M3      n2      in3     GND     GND     nmos     L=Lmin      W='3*Wmin'
M4      out_b   in1     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'
M5      out_b   in2     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'
M6      out_b   in3     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'

XINV out_b  out INV 

.ENDS AND3
**********************************AND4*********************************
.SUBCKT AND4 in1 in2 in3 in4 out

Vsupply Vdin GND vd

M1      out_b   in1     n1      GND     nmos     L=Lmin      W='4*Wmin'
M2      n1      in2     n2      GND     nmos     L=Lmin      W='4*Wmin'
M3      n2      in3     n3      GND     nmos     L=Lmin      W='4*Wmin'
M4      n3      in4     GND     GND     nmos     L=Lmin      W='4*Wmin'
M5      out_b   in1     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'
M6      out_b   in2     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'
M7      out_b   in3     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'
M8      out_b   in4     Vdin    Vdin    pmos     L=Lmin      W='2*Wmin'

XINV out_b out INV

.ENDS AND4
***********************************OR2*********************************
.SUBCKT OR2 in1 in2 out

Vsupply Vdin GND vd

M1      out_b   in1     GND     GND     nmos     L=Lmin     W=Wmin
M2      out_b   in2     GND     GND     nmos     L=Lmin     W=Wmin
M3      out_b   in1     n1      Vdin    pmos     L=Lmin     W='4*Wmin'
M4      n1      in2     Vdin    Vdin    pmos     L=Lmin     W='4*Wmin'

XINV out_b out INV

.ENDS OR2
***********************************OR3*********************************
.SUBCKT OR3 in1 in2 in3 out

Vsupply Vdin GND vd

M1      out_b   in1     GND     GND     nmos     L=Lmin      W=Wmin
M2      out_b   in2     GND     GND     nmos     L=Lmin      W=Wmin
M3      out_b   in3     GND     GND     nmos     L=Lmin      W=Wmin
M4      out_b   in1     n1      Vdin    pmos     L=Lmin      W='6*Wmin'
M5      n1      in2     n2      Vdin    pmos     L=Lmin      W='6*Wmin'
M6      n2      in3     Vdin    Vdin    pmos     L=Lmin      W='6*Wmin'

XINV out_b out INV

.ENDS OR3
***********************************OR4*********************************
.SUBCKT OR4 in1 in2 in3 in4 out

Vsupply Vdin GND vd

M1      out_b   in1     GND     GND     nmos     L=Lmin      W=Wmin
M2      out_b   in2     GND     GND     nmos     L=Lmin      W=Wmin
M3      out_b   in3     GND     GND     nmos     L=Lmin      W=Wmin
M4      out_b   in4     GND     GND     nmos     L=Lmin      W=Wmin
M5      out_b   in1     n1      Vdin    pmos     L=Lmin      W='8*Wmin'
M6      n1      in2     n2      Vdin    pmos     L=Lmin      W='8*Wmin'
M7      n2      in3     n3      Vdin    pmos     L=Lmin      W='8*Wmin'
M8      n3      in4     Vdin    Vdin    pmos     L=Lmin      W='8*Wmin'

XINV out_b out INV

.ENDS OR4
***********************************XOR2*********************************
.SUBCKT XOR2 in1 in2 out

Vsupply Vdin GND vd

XINV1   in1 in1_b   INV
XINV2   in2 in2_b   INV

M1      n1      in1     GND     GND     nmos     L=Lmin      W='2*Wmin'
M2      n2      in1_b   GND     GND     nmos     L=Lmin      W='2*Wmin'
M3      out     in2     n1      GND     nmos     L=Lmin      W='2*Wmin'
M4      out     in2_b   n2      GND     nmos     L=Lmin      W='2*Wmin'
M5      out     in1     n3      Vdin    pmos     L=Lmin      W='4*Wmin'
M6      out     in2     n3      Vdin    pmos     L=Lmin      W='4*Wmin'
M7      n3      in1_b   Vdin    Vdin    pmos     L=Lmin      W='4*Wmin'
M8      n3      in2_b   Vdin    Vdin    pmos     L=Lmin      W='4*Wmin'

.ENDS XOR2
******************************************CLA4******************************************
.SUBCKT CLA4 A1 A2 A3 A4 B1 B2 B3 B4 Cin S1 S2 S3 S4 Cout
*********Generate signals*********
XAND1   A1  B1  GG0 AND2
XAND2   A2  B2  g1  AND2
XAND3   A3  B3  g2  AND2
XAND4   A4  B4  g3  AND2

*********Propagate signals*********
XXOR1   A1  B1  GP0 XOR2
XXOR2   A2  B2  p1  XOR2
XXOR3   A3  B3  p2  XOR2
XXOR4   A4  B4  p3  XOR2

*********Group Propagate signals*********
XAND5   GP0  p1      GP1                      AND2
XAND6   GP0  p1      p2  GP2                  AND3
XAND7   GP0  p1      p2  p3  GP3              AND4

*********Group Generate signals*********
XAND8   GG0  p1      g0p1                    AND2
XOR1    g1  g0p1    GG1                      OR2

XAND9   g1  p2      g1p2                    AND2
XAND10  GG0  p1      p2      g0p1p2          AND3
XOR2    g2  g1p2    g0p1p2  GG2              OR3

XAND11  g2  p3      g2p3                    AND2
XAND12  g1  p2      p3      g1p2p3          AND3
XAND13  GG0  p1      p2      p3    g0p1p2p3  AND4
XOR3    g3  g2p3    g1p2p3  g0p1p2p3  GG3    OR4

*********Carry signals*********
XAND14  GP0  Cin PC0 AND2
XOR4    GG0  PC0 C1  OR2

XAND15  GP1  Cin  PC1 AND2
XOR5    GG1  PC1 C2 OR2

XAND16  GP2  Cin  PC2 AND2
XOR6    GG2  PC2 C3 OR2

XAND17  GP3  Cin  PC3 AND2
XOR7    GG3  PC3 Cout OR2

*********Sum signals*********
XXOR5   GP0  Cin S1  XOR2
XXOR6   p1  C1 S2   XOR2
XXOR7   p2  C2 S3   XOR2
XXOR8   p3  C3 S4   XOR2

.ENDS CLA4
*********************************Circuit********************************
XCLA0 A0  A1  A2  A3  B0  B1  B2  B3  Cin0 S0  S1  S2  S3  Cin1 CLA4
XCLA1 A4  A5  A6  A7  B4  B5  B6  B7  Cin1 S4  S5  S6  S7  Cin2 CLA4
XCLA2 A8  A9  A10 A11 B8  B9  B10 B11 Cin2 S8  S9  S10 S11 Cin3 CLA4
XCLA3 A12 A13 A14 A15 B12 B13 B14 B12 Cin3 S12 S13 S14 S15 Cout CLA4
*******************************PARAMETERS*******************************
.param  Lmin = 180n
+ Wmin = 220n
+ vd = 1.8V
******************************SIMULATION********************************
.vec    'input.vec'
.op
.tran 1p 80n
.measure    tran    tdelay  trig    V(A0)   td=40n  val='0.5*vd'    cross=1
+targ   V(S15) td=40n  val='0.5*vd'    cross=1
.tran   1p    100n
.end
.endl