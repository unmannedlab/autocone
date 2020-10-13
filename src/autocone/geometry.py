"""
"""

# import libraries
import numpy as np 

# import functionality from my libraries
import autocone.utils as utils

# import geopy for distance calculations
#from geopy.distance import geodesic

def rad2deg( angle ) : 
    # converts radians to degrees
    return angle * 180 / np.pi 

def deg2rad( angle ) :
    # converts degrees to radians
    return angle * np.pi / 180

def distance( point0, point1 ) :
    # returns the cartesian distance between two points of n Dimensions :

    # Initialize the summation
    sq_sum = 0.0

    for idx in range( np.min( [ len( point0 ), len( point1 ) ] ) ) :
        sq_sum += ( point0[ idx ] - point1[ idx ] ) ** 2
    
    return np.sqrt( sq_sum )

def bearing( point0, point1 ) :
    # returns the right hand bearing from point 0 to point 1 by performing :
    # arctan( x1 / x2 )
    # where:
    x1 = point1[1] - point0[1]
    x2 = point1[0] - point0[0]
    
    return np.math.atan2( x1, x2 )

def angle_comp_prep( angle ) :

    # Returns an equivalent angle between 2pi and 4pi

    inc = 2 * np.pi
    lb = 2 * np.pi 
    ub = 4 * np.pi

    while angle < lb :
        angle += inc
    
    while angle >= ub :
        angle -= inc 
    
    return angle 

def angle_std( angle ) :
    # Returns an equivalent angle between 0 and 2 pi
    angle = angle_comp_prep(angle)
    return angle - 2* np.pi
def angle_min_diff( angle0, angle1 ) :

    # This function will return the smallest possible difference between angle 1 and angle 0

    # There are three possible combination for these angles, 
    # 1, (angle 1 + 2pi) - angle 0
    # 2, angle 1 - (angle 0 + 2pi)
    # 3, (angle 1) - angle 0

    ang_list = [
        angle1 - angle0 + 2 * np.pi,
        angle1 - angle0 - 2 * np.pi,
        angle1 - angle0
    ]
    
    return ang_list[ utils.min_idx( np.abs( ang_list )) ]


def heading_error_calc( heading, target_heading ) :

    # Returns the bearing error in radians given a heading and a target heading
    
    return angle_min_diff( target_heading, heading )

def coord_radcvt( coord ) :
    
    coord = list(coord)
    # Return the coordinate in radians
    coord[0] = deg2rad( coord[0] )
    coord[1] = deg2rad( coord[1] )

    return coord 

def coordinate_distance( coord0, coord1 ) :

    # Return the desired distance function distance of the two coordinates:
    return geodesic( tuple(coord0[:2]), tuple(coord1[:2]) ).meters

def coordinate_bearing( coord0, coord1 ) :

    # first convert the coordinates to radian based
    coord0 = coord_radcvt( coord0 )
    coord1 = coord_radcvt( coord1 )

    # Return the bearing from coord0 to coord1
    return np.arctan2( angle_min_diff( coord0[1], coord1[1] ), angle_min_diff( coord0[0], coord1[0] ) )

def min_idx_dist2D_w_arr( pos_x, pos_y, vec_x, vec_y ) :
    # Find
    dist_vec = np.sqrt( (pos_x - vec_x) ** 2 + (pos_y - vec_y) ** 2 )
    min_dist = np.min( dist_vec[1:] )
    try :
        min_idx = [x for x in range( len(dist_vec)) if dist_vec[x] == min_dist and  x != 0][0]
    except IndexError:
        raise IndexError('There was no value which matched the minimum value given {} in the distance vector {}'.format(min_dist, dist_vec))
    return min_idx

def targ_angle_bound( angle, bound0, bound1 ):
    md_b0 = angle_min_diff(angle, bound0)
    md_b1 = angle_min_diff(angle, bound1)
    md_b = angle_min_diff(bound0, bound1)

    # Find out if bound 1 is counter clockwise or clockwise from bound 0
    if md_b >= 0 : 
        bdir = 'cw'
    else :
        bdir = 'ccw'

    # Check which is the closest bound:
    if abs(md_b0) < abs(md_b1) :
        # Bound 0 is closer

        if md_b0 >= 0:
            # if bound 0 is clockwise to the angle
            if bdir == 'cw':
                # if bound 1 is clockwise to bound 0
                return bound0
            else: 
                return angle 
            
        else:
            # if bound 0 is counter clockwise to the angle
            if bdir == 'ccw' :
                # if bound 1 is counter clockwise to bound 0
                return bound0 
            else:
                return angle


    else :
        # Bound 1 is closer
        if md_b1 >= 0:
            # if bound1 is clockwise to the angle
            if bdir == 'ccw' :
                # if bound1 is counter clockwise to bound 0
                return bound1 
            else :
                return angle 
        else:
            # if bound 1 is counter clockwise to the angle
            if bdir == 'cw':
                # if bound1 is clockwise to bound 0
                return bound1
            else :
                return angle

def target_heading_function( 
    rov_x, 
    rov_y, 
    rov_heading, 
    closest_point_x, 
    closest_point_y, 
    closest_point_heading 
    ):
    """ """
    hdg_error = angle_min_diff( rov_heading, closest_point_heading )
    brg = bearing( (rov_x, rov_y), (closest_point_x, closest_point_y))
    dist = distance( (closest_point_x, closest_point_y), (rov_x, rov_y))
    err_dist = dist * np.sin( hdg_error / 2 )
    err  = (np.math.atan(err_dist) + hdg_error)

    targ_hdg = angle_std(rov_heading+err) 

    return targ_hdg
