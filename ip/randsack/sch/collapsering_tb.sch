v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1130 -1000 1130 -970 { lab=GND}
N 1130 -1410 1130 -1390 { lab=VPWR}
N 1130 -1110 1130 -1060 { lab=start}
N 1130 -1330 1130 -1310 { lab=VGND}
N 1130 -1250 1130 -1230 { lab=GND}
N 1130 -1250 1140 -1250 { lab=GND}
N 1200 -1250 1210 -1250 { lab=VGND}
N 1210 -1250 1210 -1230 { lab=VGND}
N 1130 -1110 1540 -1110 { lab=start}
N 1480 -1050 1480 -1030 { lab=VPWR}
N 1480 -1030 1510 -1030 { lab=VPWR}
N 1510 -1090 1510 -1030 { lab=VPWR}
N 1510 -1090 1540 -1090 { lab=VPWR}
N 1840 -1150 1910 -1150 { lab=clkout}
N 1400 -1150 1540 -1150 { lab=trima[23:0]}
N 1400 -1130 1540 -1130 { lab=trimb[23:0]}
N 1350 -1250 1370 -1250 { lab=VGND}
N 1350 -1250 1350 -1230 { lab=VGND}
N 1430 -1250 1540 -1250 { lab=trimb[23:0]}
N 1350 -1320 1370 -1320 { lab=VGND}
N 1350 -1320 1350 -1300 { lab=VGND}
N 1430 -1320 1540 -1320 { lab=trima[23:2]}
N 1430 -1390 1540 -1390 { lab=trima[1:0]}
N 1350 -1390 1370 -1390 { lab=VPWR}
N 1350 -1410 1350 -1390 { lab=VPWR}
C {devices/vsource.sym} 1130 -1030 0 0 {name=V1 value="PULSE(0 1.8 100ns 1ns 1ns 9000ns 9000ns)"}
C {devices/gnd.sym} 1130 -970 0 0 {name=l2 lab=GND}
C {devices/code_shown.sym} 120 -360 0 0 {name=SPICE only_toplevel=false value="
.lib /home/harrison/workspace/sky130/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/harrison/workspace/sky130/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice

.control
save all
tran 0.1n 10u
set appendwrite
write collapsering_tb.out
.endc
"
}
C {devices/vdd.sym} 1130 -1410 0 0 {name=l10 lab=VPWR}
C {devices/gnd.sym} 1210 -1230 0 0 {name=l11 lab=VGND}
C {devices/vsource.sym} 1130 -1360 0 0 {name=V2 value="PWL(0n 0.0 30n 1.8)"}
C {devices/gnd.sym} 1130 -1230 0 0 {name=l21 lab=GND}
C {devices/gnd.sym} 1130 -1310 0 0 {name=l20 lab=VGND}
C {devices/title-2.sym} 0 -40 0 0 {name=l26 author="Harrison Pham" rev=1.0}
C {/home/harrison/workspace/randsack/ip/randsack/sch/collapsering.sym} 1690 -1120 0 0 {name=x1}
C {devices/vdd.sym} 1480 -1050 0 0 {name=l1 lab=VPWR}
C {devices/lab_wire.sym} 1910 -1150 0 0 {name=l3 sig_type=std_logic lab=clkout}
C {devices/lab_wire.sym} 1500 -1110 0 0 {name=l4 sig_type=std_logic lab=start}
C {devices/lab_wire.sym} 1500 -1150 0 0 {name=l5 sig_type=std_logic lab=trima[23:0]}
C {devices/lab_wire.sym} 1500 -1130 0 0 {name=l6 sig_type=std_logic lab=trimb[23:0]}
C {devices/gnd.sym} 1350 -1230 0 0 {name=l7 lab=VGND}
C {devices/lab_wire.sym} 1530 -1250 0 0 {name=l8 sig_type=std_logic lab=trimb[23:0]}
C {devices/gnd.sym} 1350 -1300 0 0 {name=l9 lab=VGND}
C {devices/lab_wire.sym} 1530 -1320 0 0 {name=l12 sig_type=std_logic lab=trima[23:2]}
C {devices/lab_wire.sym} 1530 -1390 0 0 {name=l14 sig_type=std_logic lab=trima[1:0]}
C {devices/vdd.sym} 1350 -1410 0 0 {name=l13 lab=VPWR}
C {devices/vsource.sym} 1400 -1390 3 0 {name=V3 value=0}
C {devices/vsource.sym} 1400 -1320 3 0 {name=V4 value=0}
C {devices/vsource.sym} 1400 -1250 3 0 {name=V5 value=0}
C {devices/vsource.sym} 1170 -1250 3 0 {name=V6 value=0}
