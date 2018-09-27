#==============================#
# Simulation parameters setup  #
#============================= #
set val(chan) Channel/WirelessChannel 
# channel type
set val(prop) Propagation/TwoRayGround 
# radio-propagation model
set val(netif) Phy/WirelessPhy
# network interface type
set val(mac) Mac/802_11
# MAC type
set val(ifq) Queue/DropTail/PriQueue 
# interface queue type
set val(ll) LL
# link layer type
set val(ant) Antenna/OmniAntenna
# antenna model
set val(ifqlen) 50
# max packet in ifq
set val(range) 200
# range of each node
set val(nn) 60
# number of nodes
set val(rp) AODV
# routing protocol
set val(x) 900
# X dimension of topography
set val(y) 900
# Y dimension of topography
set val(stop) 20.0
set val(mspeed) 30.0
# Power threshol
set val(pthres) 15
# time of simulation end

#Create wireless channel
set chan [new $val(chan)]
