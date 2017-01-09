
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <iostream>
#include <stdio.h>

void error() {
	printf("Encountered an error...");
	exit(1);
}

int main()
{
	cudaDeviceProp prop;
	int count = 0;
	if (cudaGetDeviceCount(&count))
		error();
	for (int i = 0; i < count; ++i) {
		if (cudaGetDeviceProperties(&prop, i))
			error();
		std::cout << "\tProperties of device #" << i << std::endl;
		std::cout << "Name: " << prop.name << std::endl;
		std::cout << "Compute: " << prop.major << ", " << prop.minor << std::endl;   
		std::cout << "Clock rate: " << prop.clockRate << std::endl;
		std::cout << "Device Overlap: " << prop.deviceOverlap << std::endl;
		std::cout << "Kernel Execution Timeout: " << prop.kernelExecTimeoutEnabled << std::endl;
		std::cout << std::endl << "\tMemory Information" << std::endl;
		std::cout << "Total global memory: " << prop.totalGlobalMem << std::endl;
		std::cout << "Total constant memory: " << prop.totalConstMem << std::endl;
		std::cout << "Max memory pitch: " << prop.memPitch << std::endl;
		std::cout << "Texture Alignment: " << prop.textureAlignment << std::endl;
		std::cout << std::endl << "\tMulti-Processor Information" << std::endl;
		std::cout << "Multiprocessor count: " << prop.multiProcessorCount << std::endl;
		std::cout << "Shared memory per block: " << prop.sharedMemPerBlock << std::endl;
		std::cout << "Registers per multiprocessor: " << prop.regsPerBlock << std::endl;
		std::cout << "Threads of warp: " << prop.warpSize << std::endl;
		std::cout << "Max threads per block: " << prop.maxThreadsPerBlock << std::endl;
		std::cout << "Max thread dimensions: " << prop.maxThreadsDim[0] << ", " <<
			prop.maxThreadsDim[1] << ", " << prop.maxThreadsDim[2] << std::endl;
		std::cout << "Max grid dimensions: " << prop.maxGridSize[0] << ", " <<
			prop.maxGridSize[1] << ", " << prop.maxGridSize[2] << std::endl;
		std::cout << std::endl << std::endl;
	}
	return 0;
}