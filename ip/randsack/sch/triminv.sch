v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1320 -1390 1430 -1390 { lab=ts}
N 1840 -1390 1950 -1390 { lab=d2}
N 1380 -1230 1430 -1230 { lab=ts}
N 1380 -1390 1380 -1230 { lab=ts}
N 1380 -1230 1380 -1060 { lab=ts}
N 1380 -1060 1610 -1060 { lab=ts}
N 1510 -1230 1570 -1230 { lab=d0}
N 1650 -1230 1690 -1230 { lab=d1}
N 1690 -1390 1690 -1230 { lab=d1}
N 1430 -1390 1500 -1390 { lab=ts}
N 1580 -1390 1690 -1390 { lab=d1}
N 1690 -1390 1760 -1390 { lab=d1}
N 1610 -1060 1650 -1060 { lab=ts}
N 1730 -1060 2060 -1060 { lab=OUT}
N 2060 -1390 2060 -1060 { lab=OUT}
N 2030 -1390 2060 -1390 { lab=OUT}
N 2060 -1390 2090 -1390 { lab=OUT}
N 1210 -1390 1240 -1390 { lab=IN}
N 1470 -1350 1500 -1350 { lab=TRIM1}
N 1920 -1350 1950 -1350 { lab=TRIM0}
N 1540 -1190 1570 -1190 { lab=TRIM1}
N 1620 -1020 1650 -1020 { lab=TRIM0}
C {sky130_stdcells/clkbuf_2.sym} 1280 -1390 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/title-2.sym} 0 -30 0 0 {name=l1 author="Harrison Pham" rev=1.0}
C {sky130_stdcells/einvn_4.sym} 1540 -1390 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/clkinv_1.sym} 1800 -1390 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/einvp_2.sym} 1990 -1390 0 0 {name=x4 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/clkbuf_1.sym} 1470 -1230 0 0 {name=x5 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/einvp_2.sym} 1610 -1230 0 0 {name=x6 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/einvn_8.sym} 1690 -1060 0 0 {name=x7 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1470 -1350 0 0 {name=l4 sig_type=std_logic lab=TRIM1}
C {devices/lab_pin.sym} 1540 -1190 0 0 {name=l5 sig_type=std_logic lab=TRIM1}
C {devices/lab_pin.sym} 1920 -1350 0 0 {name=l7 sig_type=std_logic lab=TRIM0}
C {devices/lab_pin.sym} 1620 -1020 0 0 {name=l8 sig_type=std_logic lab=TRIM0}
C {devices/ipin.sym} 1210 -1390 0 0 {name=p1 lab=IN}
C {devices/ipin.sym} 2090 -1390 2 0 {name=p2 lab=OUT}
C {devices/ipin.sym} 1210 -1200 0 0 {name=p3 lab=TRIM0}
C {devices/ipin.sym} 1210 -1160 0 0 {name=p4 lab=TRIM1}
C {devices/lab_wire.sym} 1380 -1390 0 0 {name=l2 sig_type=std_logic lab=ts}
C {devices/lab_wire.sym} 1650 -1390 0 0 {name=l3 sig_type=std_logic lab=d1}
C {devices/lab_wire.sym} 1560 -1230 0 0 {name=l6 sig_type=std_logic lab=d0}
C {devices/lab_wire.sym} 1910 -1390 0 0 {name=l9 sig_type=std_logic lab=d2}
