SLEEP_INTERVAL=20

epochs_i=4
ratio=0.01
for batchsize_i in 16 32 64 
do 
   echo "epochs ${epochs_i} ratio ${ratio} batchsize ${batchsize_i} monogpu"
   python benchmark.py --platform monogpu_epochs_${epochs_i}_ratio_${ratio}_batch_${batchsize_i} --epochs ${epochs_i} --interval 120 --data_ratio ${ratio} --batchsize ${batchsize_i}
   sleep ${SLEEP_INTERVAL}
   echo "epochs ${epochs_i} ratio ${ratio} batchsize ${batchsize_i} multigpu " 
   python benchmark.py --platform multigpu_epochs_${epochs_i}_ratio_${ratio}_batch_${batchsize_i} --epochs ${epochs_i} --interval 120 --data_ratio ${ratio} --batchsize ${batchsize_i} --multigpu
   sleep ${SLEEP_INTERVAL}

done


