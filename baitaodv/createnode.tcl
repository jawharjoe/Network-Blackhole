


#===============================#
#  Mobile node parameter setup  #
#===============================#

$ns node-config -adhocRouting $val(rp) \
	-llType $val(ll) \
	-macType $val(mac) \
	-ifqType $val(ifq) \
	-ifqLen $val(ifqlen) \
	-antType $val(ant) \
	-propType $val(prop) \
	-phyType $val(netif) \
	-energyModel EnergyModel \
	-initialEnergy 100 \
	-txPower 0.6 \
	-rxPower 0.2 \
	-channel $chan \
	-topoInstance $topo \
	-agentTrace ON \
	-routerTrace ON \
	-macTrace ON \
	-movementTrace ON


for {set i 0} {$i<$val(nn)} {incr i} {
	set node_($i) [$ns node] 
        set xpos($i) [myRand 100 800]
        set ypos($i) [myRand 100 800]

        if {$i==1} {
           set xpos($i) 100
           set ypos($i) 200
        }  
        if {$i==2}  { 
           set xpos($i) 700
           set ypos($i) 700
        }
        $node_($i) color black
	$node_($i) set X_ $xpos($i)  
	$node_($i) set Y_ $ypos($i)
        $node_($i) set Z_ 0.0
        
       
       
        puts "Node $i positioned at ($xpos($i),$ypos($i)) ";
	
      

	$ns initial_node_pos $node_($i) 30
	
  
}



for {set i 0 } {$i<$val(nn)} {incr i} {

   
   set blackhole($i) 0
   if {$i > 0} {

       set v [expr $i%5]
       if {$v==0} {
          set blackhole($i) 1  
       }

       set v [expr $i%4]
       if {$v==0} {
          set blackhole($i) 1  
       }

      
       
       

   }
   
   
   
  
}











