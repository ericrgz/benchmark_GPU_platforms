import matplotlib.pyplot as plt
import numpy as np

import matplotlib.cbook as cbook

cpufile="cpu_perf.out"
cpu = np.genfromtxt(cpufile, delimiter=',',)
gpufile="gpu_perf.out"
gpu = np.genfromtxt(gpufile, delimiter=',',)
cpufile="cpu_perf_rig.out"
cpurig = np.genfromtxt(cpufile, delimiter=',',)
gpufile="gpu_perf_rig_1.out"
gpurig1 = np.genfromtxt(gpufile, delimiter=',',)
gpufile="gpu_perf_rig_2.out"
gpurig2 = np.genfromtxt(gpufile, delimiter=',',)
gpufile="gpu_perf_rig_3.out"
gpurig3 = np.genfromtxt(gpufile, delimiter=',',)
 
plt.loglog(cpu[:,0],cpu[:,1],'r--', gpu[:,0],gpu[:,1],'bs',cpurig[:,0],cpurig[:,1],'bs',
 gpurig1[:,0],gpurig1[:,1],gpurig2[:,0],gpurig2[:,1],gpurig3[:,0],gpurig3[:,1] )
plt.title('Nbody cuda toolkit benchmark')
plt.legend(('laptop cpu i7', 'laptop GPU GTX1050', "cpu rig celeron", "rig GTX1070 1 device", "rig GTX1070 2 devices", "rig GTX1070 3 devices"),
           loc='upper left', shadow=True)
plt.xlabel('Bodies (size of Domain)')
plt.ylabel('Elapsed Time (ms)')


plt.show()
