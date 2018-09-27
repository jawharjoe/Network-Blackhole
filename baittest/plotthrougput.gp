set term jpeg

set title "aodv Throughput"

set xlabel "Time"
set ylabel "Throughput"
set output "rthroughput.jpg"

plot "thrput.tr" using 1:2 title "Throughput" with linespoints 

