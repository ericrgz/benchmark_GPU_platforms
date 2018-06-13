export LD_LIBRARY_PATH=/usr/local/cuda/lib64

for idx in 0 1 2
do
   export CUDA_VISIBLE_DEVICES=${idx}
   python benchmark.py --platform concur_${idx} --epochs 1 --interval 120 --data_ratio 0.5 &
done 
