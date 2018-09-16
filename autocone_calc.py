import math

# Sometimes angles will need to be converted from negative to positive values 0<deg<360 or 0<rad<2pi
def deg2stddeg(deg):
	stddeg = (2*360 + deg)%360
	return stddeg
def rad2stdrad(rad):
	stdrad = (2*2*math.pi+rad)%(2*math.pi)
	return stdrad
# Sometimes degrees will need to be converted
def deg2rad(deg): 
	rad = float(deg * math.pi / 180)
	return rad
# Sometimes radians will need to be converted
def rad2deg(rad):
	deg = rad * 180/math.pi
	return deg

# Calculation to calculate the difference between two gps cooridinates:
def wp_dist(wp1, wp2):
	R_Earth = 6371 # km
	dlat = deg2rad(wp2[0]-wp1[0])
	dlon = deg2rad(wp2[1]-wp2[1])
	lat1 = deg2rad(wp1[0])
	lat2 = deg2rad(wp2[0])
	a = (math.sin(dlat/2))**2 + (math.sin(dlon/2))**2 * math.cos(lat1) * math.cos(lat2)
	c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
	
	return R_Earth * c 
def 

