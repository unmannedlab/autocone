
# Define a function to add a new value to the end of the list:

# Buffer_add function will add new values to the top/front of the list [0th index] and shift all other elements down/backwards 1 index. If a max sized is defined it will delete the element that is pushed beyond that max size; 
####however the current implementation does not delete multiple elements beyond the max size.
def buffer_add(list_variable, new_value, max_size):
	list_range = list()
	list_range = range(len(list_variable))
	print(list_range)
	list_range.reverse()
	print(list_range)
	list_variable.append(None)
	for idx in list_range:
		list_variable[idx+1] = list_variable[idx]
	if len(list_variable)+1>max_size:
		list_variable.pop()
	list_variable[0] = new_value
	return list_variable


if __name__ == '__main__':
	list_variable = [1, 2, 3, 4, 5]
	new_value = 0
	max_size = 5
	
	list_variable = buffer_add(list_variable, new_value, max_size)
	print(list_variable)
	#print(range(0, len(list_variable)))
	#print(len(list_variable))
	#print(range(5))
	
