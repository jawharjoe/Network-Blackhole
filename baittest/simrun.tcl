source myutil.tcl
source createsim.tcl
source createnode.tcl





for  {set i 0} {$i<$val(nn)} {incr i} {
   
   
   if {$blackhole($i)==1} {
      $ns at 0.0 "$node_($i) label BH"
      $ns at 0.0 "$node_($i) color black"
   }

   if {$blackhole($i)!=1} {
      $ns at 0.0 "$node_($i) label N"
      $ns at 0.0 "$node_($i) color green" 
      
   }
}


$ns at 1.0 "$node_(1) label S"
$ns at 1.0 "$node_(1) color red"

$ns at 1.0 "$node_(2) label D"
$ns at 1.0 "$node_(2) color red"


proc moveNodes {} {
  global val node_ destxpos destypos ns

  for {set i 0} {$i<$val(nn)} {incr i} {
    
       set x [$node_($i) set X_] 
       set y [$node_($i) set Y_]
     
      

          set nx [myRand 100 800] 
          set ny [myRand 100 800]
          set ti [$ns now]
          $ns at $ti "$node_($i) setdest $nx $ny $val(mspeed)"
          
            
       
  }
  
  


}




 
proc record { } {
  
    global inter

    set ns_ [Simulator instance]

    set bw0 [$inter set bytes_]
        
    set bw8 [$inter set lastPktTime_]
    set bw9 [$inter set npkts_]

    set time 0.5

    set bw4 [$inter set nlost_]
   
    #Get the current time
    set now [$ns_ now]
    
    set val [expr $bw8-1]
    
    set bw [expr $bw0/($val*1000)] 
    
   
     
    


} 


set fx0 [open thrput.tr w] 
set fx1 [open delay.tr w]
set fx2 [open lost.tr w]
 
proc record { } {
  
    global inter fx0 fx1 fx2

    set ns_ [Simulator instance]

    set bw0 [$inter set bytes_]
        
    set bw8 [$inter set lastPktTime_]
    set bw9 [$inter set npkts_]

    set time 0.5

    set bw4 [$inter set nlost_]
   
    #Get the current time
    set now [$ns_ now]
    
    set val [expr $bw8-1]

    
    
    set bw [expr $bw0/($val*1000)]

    set delay [expr $bw8*1.0]
    if {$bw9!=0} { 
    set delay [expr $bw8*1.0/$bw9]
    }
    set lost $bw4
   
    puts $fx0 "$now $bw"
    puts $fx1 "$now $delay"
    puts $fx2 "$now $lost"

    #Reset the bytes_ values on the traffic sinks
    #$inter set bytes_ 0
    
    $ns_ at [expr $now+$time] "record"
    

} 


proc finish {} {
global tracefile namfile pl val rl fx3 fx4

close $tracefile
close $namfile



puts "Simulation completed , pls check results !!!!!!!";



} 




for {set i 0} {$i < $val(nn) } { incr i } {
$ns at $val(stop) "\$node_($i) reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"



$ns at 1.0 "createUDPConnection 1 2"
$ns at 1.1 "createUDPConnection 1 2"
$ns at 0.5 "moveNodes"
$ns at 1.3 "record"



$ns run

