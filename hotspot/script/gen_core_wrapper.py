import sys

def main(argv):
	num_cores = argv
	
	#information of the benchmark
	#should be changed according to each benchmark
	header_file = ""
	kernel_type = "void"
	kernel_name = "calculate_temp"
	kernel_params = "int iteration, int grid_cols, int grid_rows, int border_cols, int border_rows, float Cap, float Rx, float Ry, float Rz, float step, float time_elapsed, float * memport, dim3 grid, dim3 threads"

	list_params = [x.strip() for x in kernel_params.split(',')]
	list_args = [x.split(' ')[-1] for x in list_params]
	kernel_args = ', '.join(list_args)
	
	#generate core_wrapper file	
	wrapper_file = open("core_wrapper.c", 'w')
	wrapper_file.write("#ifdef NOC\n")
	wrapper_file.write("#include <fcuda.h>\n");
        if header_file != "":
	    wrapper_file.write("#include " + "\"" + header_file + "\"" + "\n")
	for i in range(num_cores):
		wrapper_file.write(kernel_type + " " + kernel_name + "_core" + str(i) + "(" + kernel_params + ");\n")

	wrapper_file.write(kernel_type + " " + kernel_name + "_core_wrapper(" + kernel_params + ")\n")
	wrapper_file.write("{\n")
	for i in range(num_cores):
		wrapper_file.write(kernel_name + "_core" + str(i) + "(" + kernel_args + ");\n")
	wrapper_file.write("}\n")
	wrapper_file.write("#endif")

if __name__ == "__main__":
	try:
		arg = int(sys.argv[1])
	except:
		print "Error. The command should be: python gen_core_wrapper.py <num_cores>"
		print "Example: python gen_core_wrapper.py 4"
		sys.exit()

	main(arg)

