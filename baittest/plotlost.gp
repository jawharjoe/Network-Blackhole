set term jpeg

set title "Lost"

set xlabel "Time"
set ylabel "lost"
set output "rlost.jpg"

plot "lost.tr" using 1:2 title "Lost" with linespoints 
