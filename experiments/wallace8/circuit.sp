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
******************************Wallace Tree******************************
.SUBCKT Wallace  A0  A1  A2  A3  A4  A5  A6  A7  B0  B1  B2  B3  B4  B5  B6  B7  M0  M1  M2  M3  M4  M5  M6  M7  M8  M9  M10  M11  M12  M13  M14  M15
************AND GATES************
XAND0   A0    B0    VS0     AND2
XAND1   A0    B1    Z01     AND2
XAND2   A0    B2    Z02     AND2
XAND3   A0    B3    Z03     AND2
XAND4   A0    B4    Z04     AND2
XAND5   A0    B5    Z05     AND2
XAND6   A0    B6    Z06     AND2
XAND7   A0    B7    Z07     AND2
XAND8   A1    B0    Z10     AND2
XAND9   A1    B1    Z11     AND2
XAND10  A1    B2    Z12     AND2
XAND11  A1    B3    Z13     AND2
XAND12  A1    B4    Z14     AND2
XAND13  A1    B5    Z15     AND2
XAND14  A1    B6    Z16     AND2
XAND15  A1    B7    Z17     AND2
XAND16  A2    B0    Z20     AND2
XAND17  A2    B1    Z21     AND2
XAND18  A2    B2    Z22     AND2
XAND19  A2    B3    Z23     AND2
XAND20  A2    B4    Z24     AND2
XAND21  A2    B5    Z25     AND2
XAND22  A2    B6    Z26     AND2
XAND23  A2    B7    Z27     AND2
XAND24  A3    B0    Z30     AND2
XAND25  A3    B1    Z31     AND2
XAND26  A3    B2    Z32     AND2
XAND27  A3    B3    Z33     AND2
XAND28  A3    B4    Z34     AND2
XAND29  A3    B5    Z35     AND2
XAND30  A3    B6    Z36     AND2
XAND31  A3    B7    Z37     AND2
XAND32  A4    B0    Z40     AND2
XAND33  A4    B1    Z41     AND2
XAND34  A4    B2    Z42     AND2
XAND35  A4    B3    Z43     AND2
XAND36  A4    B4    Z44     AND2
XAND37  A4    B5    Z45     AND2
XAND38  A4    B6    Z46     AND2
XAND39  A4    B7    Z47     AND2
XAND40  A5    B0    Z50     AND2
XAND41  A5    B1    Z51     AND2
XAND42  A5    B2    Z52     AND2
XAND43  A5    B3    Z53     AND2
XAND44  A5    B4    Z54     AND2
XAND45  A5    B5    Z55     AND2
XAND46  A5    B6    Z56     AND2
XAND47  A5    B7    Z57     AND2
XAND48  A6    B0    Z60     AND2
XAND49  A6    B1    Z61     AND2
XAND50  A6    B2    Z62     AND2
XAND51  A6    B3    Z63     AND2
XAND52  A6    B4    Z64     AND2
XAND53  A6    B5    Z65     AND2
XAND54  A6    B6    Z66     AND2
XAND55  A6    B7    Z67     AND2
XAND56  A7    B0    Z70     AND2
XAND57  A7    B1    Z71     AND2
XAND58  A7    B2    Z72     AND2
XAND59  A7    B3    Z73     AND2
XAND60  A7    B4    Z74     AND2
XAND61  A7    B5    Z75     AND2
XAND62  A7    B6    Z76     AND2
XAND63  A7    B7    Z77     AND2
************FAs & HAs************
******First Stage******
XHA1    Z01         Z10         VS1     P1Cout1      HA
XFA1    Z02         Z11         Z20         P1S1     P1Cout2    FA
XFA2    Z03         Z12         Z21         P1S2     P1Cout3    FA
XFA3    Z04         Z13         Z22         P1S3     P1Cout4    FA
XFA4    Z05         Z14         Z23         P1S4     P1Cout5    FA
XFA5    Z06         Z15         Z24         P1S5     P1Cout6    FA
XFA6    Z07         Z16         Z25         P1S6     P1Cout7    FA
XHA2    Z17         Z26         P1S7    P1Cout8      HA

XHA3    Z31         Z40         P1S8    P1Cout9      HA
XFA7    Z32         Z41         Z50         P1S9     P1Cout10   FA
XFA8    Z33         Z42         Z51         P1S10    P1Cout11   FA
XFA9    Z34         Z43         Z52         P1S11    P1Cout12   FA
XFA10   Z35         Z44         Z53         P1S12    P1Cout13   FA
XFA11   Z36         Z45         Z54         P1S13    P1Cout14   FA
XFA12   Z37         Z46         Z55         P1S14    P1Cout15   FA
XHA4    Z47         Z56         P1S15   P1Cout16      HA

******Second Stage******
XHA5    P1S1        P1Cout1     VS2     P2Cout1     HA
XFA13   P1S2        P1Cout2     Z30         P2S1     P2Cout2    FA
XFA14   P1S3        P1Cout3     P1S8        P2S2     P2Cout3    FA
XFA15   P1S4        P1Cout4     P1S9        P2S3     P2Cout4    FA
XFA16   P1S5        P1Cout5     P1S10       P2S4     P2Cout5    FA
XFA17   P1S6        P1Cout6     P1S11       P2S5     P2Cout6    FA
XFA18   P1S7        P1Cout7     P1S12       P2S6     P2Cout7    FA
XFA19   Z27         P1Cout8     P1S13       P2S7     P2Cout8    FA

XHA6    P1Cout10    Z60         P2S8    P2Cout9     HA
XFA20   P1Cout11    Z61         Z70         P2S9     P2Cout10   FA
XFA21   P1Cout12    Z62         Z71         P2S10    P2Cout11   FA
XFA22   P1Cout13    Z63         Z72         P2S11    P2Cout12   FA
XFA23   P1Cout14    Z64         Z73         P2S12    P2Cout13   FA
XFA24   P1Cout15    Z65         Z74         P2S13    P2Cout14   FA
XFA25   P1Cout16    Z66         Z75         P2S14    P2Cout15   FA
XHA7    Z67         Z76         P2S15   P2Cout16    HA

******third Stage******
XHA8    P2S1        P2Cout1     VS3     P3Cout1     HA
XHA9    P2S2        P2Cout2     P3S1    P3Cout2     HA
XFA26   P2S3        P2Cout3     P1Cout9     P3S2     P3Cout3    FA
XFA27   P2S4        P2Cout4     P2S8        P3S3     P3Cout4    FA
XFA28   P2S5        P2Cout5     P2S9        P3S4     P3Cout5    FA
XFA29   P2S6        P2Cout6     P2S10       P3S5     P3Cout6    FA
XFA30   P2S7        P2Cout7     P2S11       P3S6     P3Cout7    FA
XFA31   P1S14       P2Cout8     P2S12       P3S7     P3Cout8    FA
XHA10   P1S15       P2S13       P3S8    P3Cout9     HA
XHA11   Z57         P2S14       P3S9    P3Cout10    HA

******Fourth Stage******
XHA12   P3S1        P3Cout1     VS4     VC5         HA
XHA13   P3S2        P3Cout2     VS5     VC6         HA
XHA14   P3S3        P3Cout3     VS6     VC7         HA
XFA32   P3S4        P3Cout4     P2Cout9     VS7      VC8        FA
XFA33   P3S5        P3Cout5     P2Cout10    VS8      VC9        FA
XFA34   P3S6        P3Cout6     P2Cout11    VS9      VC10       FA
XFA35   P3S7        P3Cout7     P2Cout12    VS10     VC11       FA
XFA36   P3S8        P3Cout8     P2Cout13    VS11     VC12       FA
XFA37   P3S9        P3Cout9     P2Cout14    VS12     VC13       FA
XFA38   P2S15       P3Cout10    P2Cout15    VS13     VC14       FA
XHA15   Z77         P2Cout16    VS14    VC15        HA

******Final Addition******
XCLA0 VS0 VS1 VS2 VS3 GND GND GND GND GND M0 M1 M2 M3 Cin1 CLA4
XCLA1 VS4 VS5 VS6 VS7 GND VC5 VC6 VC7 Cin1 M4 M5 M6 M7 Cin2 CLA4
XCLA2 VS8 VS9 VS10 VS11 VC8 VC9 VC10 VC11 Cin2 M8 M9 M10 M11 Cin3 CLA4
XCLA3 VS12 VS13 VS14 GND VC12 VC13 VC14 VC15 Cin3 M12 M13 M14 M15 Cout CLA4

.ENDS
*******************************CIRCUIT**********************************
XMul     A0  A1  A2  A3  A4  A5  A6  A7  B0  B1  B2  B3  B4  B5  B6  B7  M0  M1  M2  M3  M4  M5  M6  M7  M8  M9  M10  M11  M12  M13  M14  M15   Wallace
*******************************PARAMETERS*******************************
.param  Lmin = 180n
+ Wmin = 220n
+ vd = 1.8V
******************************SIMULATION********************************
.vec    'input.vec'
.op
.tran   1p    100n
.measure    tran    tdelay  trig    V(A0)   td=40n  val='0.5*vd'    cross=1
+targ   V(M15) td=40n  val='0.5*vd'    cross=1
.print V(M0)    V(M1)    V(M2)    V(M3)    V(M4)    V(M5)    V(M6)    V(M7)    V(M8)    V(M9)    V(M10)    V(M11)    V(M12)    V(M13)    V(M14)    V(M15)
.end
.endl