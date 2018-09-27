set term jpeg

set title "aodv delay"

set xlabel "Time"
set ylabel "delay"
set output "rdelay.jpg"

plot "delay.tr" using 1:2 title "Delay" with linespoints 


