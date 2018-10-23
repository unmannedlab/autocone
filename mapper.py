from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as plt
import math

def mapper(wp_list):
	lat_max, lat_min, lon_max, lon_min = wp_list[0][0] , wp_list[0][0], wp_list[0][1], wp_list[0][1]
	for wp in wp_list:
		if wp[0] > lat_max:
			lat_max = wp[0]
		elif wp[0] < lat_min:
			lat_min = wp[0]
		if wp[1] > lon_max:
			lon_max = wp[1]
		elif wp[1] < lon_max:
			lon_min = wp[1]

	m = Basemap(projection='mill',
		llcrnrlat = (lat_min),
		llcrnrlon = (lon_min),
		urcrnrlat = (lat_max),
		urcrnrlon = (lon_max),
		resolution = 'l')
	m.drawcoastlines()
	m.drawcountries(linewidth=2)
	m.drawstates(color='b')
	xs = []
	ys = []
	i = 0
	# Plot the markers in the waypoint list:
	for wp in wp_list:
		xpt, ypt = m(wp[1], wp[0])
		xs.append(xpt)
		ys.append(ypt)
		m.plot(xpt, ypt, 'co')
		#print(i)
		i+=1
	m.plot(xs, ys, 'r')

	plt.title('Map')
	plt.show()
