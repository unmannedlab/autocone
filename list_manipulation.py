
# Define a function to add a new value to the end of the list:

def buffer_add(list_variable, new_value, max_size):
	if len(list_variable) < max_size:
		list_variable.append(new_value)
	else:
		for i in range(len(list_variable)):
			if i<len(list_variable)-1 and i>=0:
				list_variable[i] = list_variable[i+1]
			elif i==len(list_variable)-1:
				list_variable[i] = new_value
	return list_variable
if __name__ == '__main__':
	list_variable = [1, 2, 3, 4, 5]
	new_value = 6
	max_size = 5
	
	list_variable = buffer_add(list_variable, new_value, max_size)
	print(list_variable)
	#print(range(0, len(list_variable)))
	#print(range(0, 5))
