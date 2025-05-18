# NOTES FOR MYSELF
#
# EXAMPLE WITH  [1 2 3 4]
# left to right

#At index 0 theres nothing on the left, so is 1.

#At index 1 number to the left is 1, left product is 1.

#At index 2 numbers to the left are 1 and 2, left product is 1x2=2.

#At index 3 numbers to the left are 1 2 3, left product is 1x2x3=6

#array_left_to_right [1 1 2 6]

#right to left

#At index 3 theres nothing to the right,  1.

#At index 2 numbers to the right is 4,  4.

#At index 1 numbers to the right are 3  4, 3x4=12.

#At index 0 numbers to the right are 2 3 4, 2x3x4=24.

#array_right_to_left [24 12 4 1]

#final_result= array_left_to_right x array_right_to_left = 24 12 8 6


numbers_list = list(map(int, input("Enter numbers separated by spaces: ").split()))

n = len(numbers_list)
products_left_to_right_except_i_element = [1] * n
products_right_to_left_except_i_element = [1] * n
result = [1] * n

for i in range(1, n):
    products_left_to_right_except_i_element[i] = products_left_to_right_except_i_element[i-1] * numbers_list[i-1]

for i in range(n-2, -1, -1):
    products_right_to_left_except_i_element[i] = products_right_to_left_except_i_element[i+1] * numbers_list[i+1]

for i in range(n):
    result[i] = products_left_to_right_except_i_element[i] * products_right_to_left_except_i_element[i]

print(result)
