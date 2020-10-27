"""
Utilities module for different house keeping functions for the rest of the autocone codebase.
"""

# import relavent libraries
import numpy as np 


def get_idx_of( targ_val, listvar ):
    
    # Returns the idx of the target_val in the list var
    for idx in range( len( listvar ) ) :

        # Return the idx if it matches the target
        if listvar[idx] == targ_val :
            return idx 
    
def min_idx( listvar ) :

    # Returns the idx of the minimum value of a list
    min_val = min( listvar )

    return get_idx_of( min_val, listvar )

def max_idx( listvar ) :

    # Returns the idx of the maximum value of a list

    max_val = max( listvar )

    return get_idx_of( max_val, listvar )

class queue_array_handler_2D :
    """This object will handle an array in the same way as a queue of a specified dimensions"""
    def __init__(self, max_length, no_columns) :
        
        # Generate the data array
        self.data = np.zeros( (max_length, no_columns) )

        self.curr_max_idx = None
        self.max_length = max_length
        self.no_columns = no_columns

    def shift_down_add( self, tuple_var ):
        # Grab the first entry for returning
        ret_item = list()
        for idx in range(self.no_columns):
            ret_item.append( self.data[0,idx] )
        ret_item = tuple(ret_item)

        # Shift everything down:
        self.data[0:(self.max_length-1),:] = self.data[1:,:]

        # Replace the last value
        for idx in range(self.no_columns) :
            self.data[(self.max_length-1), idx]
        
        return ret_item


    def add(self, tuple_var) :

        if self.curr_max_idx == None or self.curr_max_idx < self.max_length - 1 :
            # Simply add the item to the end
            if self.curr_max_idx == None:
                self.curr_max_idx = -1 
            ridx = self.curr_max_idx + 1
            for cidx in range( self.no_columns ) :
                self.data[ridx,cidx] = tuple_var[cidx]
            self.curr_max_idx = ridx 

            return None

        elif self.curr_max_idx == self.max_length - 1 :

            ret_item = self.shift_down_add( tuple_var )

            return ret_item

    def pull(self):
        # This will get the first item and shift the entire structure down
        if self.curr_max_idx > 0 :
            # Create a tuple of zeros
            zero_tuple = list()
            for _ in range( self.no_columns ) :
                zero_tuple.append(0)
            zero_tuple = tuple(zero_tuple)

            ret_item = self.shift_down_add(zero_tuple)

            self.curr_max_idx -= 1

            return ret_item
        
        else:
            return None

    def show_last(self):
        # This will show the latest entry by returning it as a tuple
        tuple_var= list()
        for idx in range( self.no_columns ):
            tuple_var.append(self.data[self.curr_max_idx, idx])

        return tuple(tuple_var)

        
    def get_whole_array(self):
        return self.data[:self.curr_max_idx+1, :]