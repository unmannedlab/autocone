from geopy.distance import geodesic
import mapper
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
		for j in range(0,n_points):
			lat_err = float(decimal.Decimal(random.randrange(0, 100*max_error))/100000000)
			lon_err = float(decimal.Decimal(random.randrange(0, 100*max_error))/100000000)
			lat_sim = lat_err + (wp2[0]-wp1[0]) * j / n_points + wp1[0]
			lon_sim = lon_err + (wp2[1]-wp1[1]) * j / n_points + wp1[1]
			wp_sim_ent = (lat_sim, lon_sim)
			wp_sim_list.append(wp_sim_ent)
	return wp_sim_list

def gps_data_avg_smoother(data_list, freq):
	gps_data = []
	i = 0
	while i<len(data_list):
		sum_lat = 0
		sum_lon = 0
		j = 0
		while j<freq and i+j < len(data_list):
			sum_lat += data_list[i+j][0]
			sum_lon += data_list[i+j][1]
			j+=1
		gps_data.append((sum_lat / j, sum_lon / j))
		i += j
	return gps_data

if __name__ == '__main__':
	wp_list = [(30.561646, -96.2606239) , (30.57528083, -96.2776815)]
	max_error = 1
	freq = 120
	speed = 7.5

	wp_sim_list = wp_gen(wp_list, freq, speed, max_error)
	print(len(wp_sim_list))
	gps_data = gps_data_avg_smoother(wp_sim_list, freq)
	print(len(gps_data))
	mapper.mapper(gps_data)


