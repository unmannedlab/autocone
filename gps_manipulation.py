from geopy.distance import geodesic
#import mapper
import random, decimal 
import math
def wp_gen(wp_list, freq, speed, max_error):
	wp_sim_list = list()
	indexer = range(0, len(wp_list)-1)
	print(indexer)	
	for i in indexer:
		wp_dist = geodesic(wp_list[i], wp_list[i+1]).meters
		t_dist = wp_dist / speed
		n_points = int(math.floor(t_dist * freq))
		wp1 = wp_list[i]
		wp2 = wp_list[i+1]
		print(n_points)
		for j in range(0,n_points):
			if int(100*max_error)>0:
				lat_err = float(decimal.Decimal(random.randrange(0, int( 100*max_error)))/100000000)
				lon_err = float(decimal.Decimal(random.randrange(0, int(100*max_error)))/100000000)
			else:
				lat_err = 0.0
				lon_err = 0.0

			lat_sim = float(lat_err + (wp2[0]-wp1[0]) * j / n_points + wp1[0])
			lon_sim = float(lon_err + (wp2[1]-wp1[1]) * j / n_points + wp1[1])
			wp_sim_ent = (lat_sim, lon_sim)
			print(j, wp_sim_ent)
			wp_sim_list.append(wp_sim_ent)
	return wp_sim_list

def gps_data_avg_smoother(data_list, freq):
	gps_data = []
	i = 0
	while i<len(data_list):
		sum_lat = 0
		sum_lon = 0
		sum_hdg = 0
		j = 0
		while j<freq and i+j < len(data_list):
			sum_lat += data_list[i+j][0]
			sum_lon += data_list[i+j][1]
			if i+j+1 < len(data_list):
				sum_hdg += math.atan2((data_list[i+j+1][1]-data_list[i+j][1]), (data_list[i+j+1][0]-data_list[i+j][0]))
			j+=1
		gps_data.append((sum_lat / j, sum_lon / j, (2*360 + sum_hdg / j  * 180 / math.pi)%360))
		print(gps_data[len(gps_data)-1])
		i += j
	return gps_data
def gps_data_idxr(gps_data, gps_0, targ_dist):
	i = 0
	while i < len(gps_data) and len(gps_data)-2*i>3:
		if gps_data[i][0]>gps_0[0] and gps_data[len(gps_data)-i-1][0]<gps_0[0]:
			i+=1
		elif gps_data[i][0]<gps_0[0] and gps_data[len(gps_data)-i-1][0]>gps_0[0]:
			i+=1
	j = 0
	while j < len(gps_data) and len(gps_data)-2*j>3:
		if gps_data[j][1]>gps_0[1] and gps_data[len(gps_data)-j-1][1]<gps_0[1]:
			j+=1
		elif gps_data[j][1]<gps_0[1] and gps_data[len(gps_data)-j-1][1]>gps_0[1]:
			j+=1
	if i == j:
		return gps_data[i]
if __name__ == '__main__':
	wp_list = [(30.561646, -96.2606239) , (30.57528083, -96.2776815)]
	max_error = 1
	freq = 120
	speed = 7.5

	wp_sim_list = wp_gen(wp_list, freq, speed, max_error)
	#print(len(wp_sim_list))
	gps_data = gps_data_avg_smoother(wp_sim_list, freq)
	print(len(gps_data))
	mapper.mapper(gps_data)
	


