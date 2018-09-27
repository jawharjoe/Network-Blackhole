source simconf.tcl

#====================#
#   Initialization   #
#====================#

#Create a ns simulator
set ns [new Simulator]


#Open the NS trace file
set tracefile [open out1.tr w]
$ns use-newtrace
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)



#Setup topography object
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
set god [create-god $val(nn)]


