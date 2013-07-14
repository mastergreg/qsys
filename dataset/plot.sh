#!/bin/bash
#set format y "%H:%M:%S"
gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "3_a_propabilities.eps"
set title 'Propability Graph L = 3'

set yrange[0:1]


set ylabel "Propability"
set xlabel "State"

set grid

plot\
    '3.prop.log'          using 2:xtic(1) title "k = 0"   smooth csplines lw 2, \
    '3.prop.log'          using 3:xtic(1) title "k = 1"   smooth csplines lw 2, \
    '3.prop.log'          using 4:xtic(1) title "k = 2"   smooth csplines lw 2, \
    '3.prop.log'          using 5:xtic(1) title "k = 3"   smooth csplines lw 2, \
    '3.prop.log'          using 6:xtic(1) title "k = 4"   smooth csplines lw 2, \
    '3.prop.log'          using 7:xtic(1) title "k = 5"   smooth csplines lw 2
EOF

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "3_b_propabilities.eps"
set title 'Propability Graph L = 3'

set yrange[0:1]

set ylabel "Propability"
set xlabel "State"

set grid

plot\
    '3.prop.log'          using 8:xtic(1) title "k = 6"   smooth csplines lw 2, \
    '3.prop.log'          using 9:xtic(1) title "k = 7"   smooth csplines lw 2, \
    '3.prop.log'          using 10:xtic(1) title "k = 8"   smooth csplines lw 2, \
    '3.prop.log'          using 11:xtic(1) title "k = 9"   smooth csplines lw 2, \
    '3.prop.log'          using 12:xtic(1) title "k = 10"   smooth csplines lw 2, \
    '3.prop.log'          using 13:xtic(1) title "k = 11"   smooth csplines lw 2
EOF


gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "5_a_propabilities.eps"
set title 'Propability Graph L = 5'

set yrange[0:1]

set ylabel "Propability"
set xlabel "State"

set grid

plot\
    '5.prop.log'          using 2:xtic(1) title "k = 0"   smooth csplines lw 2, \
    '5.prop.log'          using 3:xtic(1) title "k = 1"   smooth csplines lw 2, \
    '5.prop.log'          using 4:xtic(1) title "k = 2"   smooth csplines lw 2, \
    '5.prop.log'          using 5:xtic(1) title "k = 3"   smooth csplines lw 2, \
    '5.prop.log'          using 6:xtic(1) title "k = 4"   smooth csplines lw 2, \
    '5.prop.log'          using 7:xtic(1) title "k = 5"   smooth csplines lw 2
EOF

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "5_b_propabilities.eps"
set title 'Propability Graph L = 5'

set yrange[0:1]

set ylabel "Propability"
set xlabel "State"

set grid

plot\
    '5.prop.log'          using 8:xtic(1) title "k = 6"   smooth csplines lw 2, \
    '5.prop.log'          using 9:xtic(1) title "k = 7"   smooth csplines lw 2, \
    '5.prop.log'          using 10:xtic(1) title "k = 8"   smooth csplines lw 2, \
    '5.prop.log'          using 11:xtic(1) title "k = 9"   smooth csplines lw 2, \
    '5.prop.log'          using 12:xtic(1) title "k = 10"   smooth csplines lw 2, \
    '5.prop.log'          using 13:xtic(1) title "k = 11"   smooth csplines lw 2
EOF




gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "12_a_propabilities.eps"
set title 'Propability Graph L = 12'

set yrange[0:1]

set ylabel "Propability"
set xlabel "State"

set grid

plot\
    '12.prop.log'          using 2:xtic(1) title "k = 0"   smooth csplines lw 2, \
    '12.prop.log'          using 3:xtic(1) title "k = 1"   smooth csplines lw 2, \
    '12.prop.log'          using 4:xtic(1) title "k = 2"   smooth csplines lw 2, \
    '12.prop.log'          using 5:xtic(1) title "k = 3"   smooth csplines lw 2, \
    '12.prop.log'          using 6:xtic(1) title "k = 4"   smooth csplines lw 2, \
    '12.prop.log'          using 7:xtic(1) title "k = 5"   smooth csplines lw 2
EOF

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "12_b_propabilities.eps"
set title 'Propability Graph L = 12'

set yrange[0:1]

set ylabel "Propability"
set xlabel "State"

set grid

plot\
    '12.prop.log'          using 8:xtic(1) title "k = 6"   smooth csplines lw 2, \
    '12.prop.log'          using 9:xtic(1) title "k = 7"   smooth csplines lw 2, \
    '12.prop.log'          using 10:xtic(1) title "k = 8"   smooth csplines lw 2, \
    '12.prop.log'          using 11:xtic(1) title "k = 9"   smooth csplines lw 2, \
    '12.prop.log'          using 12:xtic(1) title "k = 10"   smooth csplines lw 2, \
    '12.prop.log'          using 13:xtic(1) title "k = 11"   smooth csplines lw 2
EOF




#PART II

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "3_2_propabilities.eps"
set title 'Propability Graph L = 3'


set ylabel "Propability"
set xlabel "K"

set grid

plot\
    '3.2.log'          using 2:xtic(1) notitle smooth csplines lw 2
EOF

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "5_2_propabilities.eps"
set title 'Propability Graph L = 5'


set ylabel "Propability"
set xlabel "K"

set grid

plot\
    '5.2.log'          using 2:xtic(1) notitle smooth csplines lw 2
EOF

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "12_2_propabilities.eps"
set title 'Propability Graph L = 12'


set ylabel "Propability"
set xlabel "K"

set grid

plot\
    '12.2.log'          using 2:xtic(1) notitle smooth csplines lw 2
EOF



#PARG III

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "e_n.eps"
set title 'E_N(K)'


set ylabel 'E_N(K)'
set xlabel "K"

set grid

plot\
    'e.log'          using 2:xtic(1) title "l = 3" smooth csplines lw 2, \
    'e.log'          using 3:xtic(1) title "l = 5" smooth csplines lw 2, \
    'e.log'          using 4:xtic(1) title "l = 12" smooth csplines lw 2
EOF

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "g.eps"
set title 'g(K)'


set ylabel 'g(K)'
set xlabel "K"

set grid

plot\
    'g.log'          using 2:xtic(1) title "l = 3" smooth csplines lw 2, \
    'g.log'          using 3:xtic(1) title "l = 5" smooth csplines lw 2, \
    'g.log'          using 4:xtic(1) title "l = 12" smooth csplines lw 2
EOF

gnuplot << EOF

set terminal postscript eps enhanced color font ",20"
set output "t.eps"
set title 'T(K)'


set ylabel 'T(K)'
set xlabel "K"

set grid

plot\
    't.log'          using 2:xtic(1) title "l = 3" smooth csplines lw 2, \
    't.log'          using 3:xtic(1) title "l = 5" smooth csplines lw 2, \
    't.log'          using 4:xtic(1) title "l = 12" smooth csplines lw 2
EOF


epstopdf 3_a_propabilities.eps
epstopdf 3_b_propabilities.eps
epstopdf 5_a_propabilities.eps
epstopdf 5_b_propabilities.eps
epstopdf 12_a_propabilities.eps
epstopdf 12_b_propabilities.eps




epstopdf 3_2_propabilities.eps
epstopdf 5_2_propabilities.eps
epstopdf 12_2_propabilities.eps



epstopdf e_n.eps
epstopdf g.eps
epstopdf t.eps
