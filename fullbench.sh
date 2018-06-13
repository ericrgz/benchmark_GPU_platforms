SLEEP_INTERVAL=20

for ratio in 0.1 0.5 1.
do
   for epochs_i in 1 4 
   do 
      echo "epochs ${epochs_i} ratio ${ratio} monogpu"
      python benchmark.py --platform monogpu_epochs_${epochs_i}_ratio_${ratio} --epochs ${epochs_i} --interval 120 --data_ratio ${ratio}
      sleep ${SLEEP_INTERVAL}
      echo "epochs ${epochs_i} ratio ${ratio} multigpu"
      python benchmark.py --platform multigpu_epochs_${epochs_i}_ratio_${ratio} --epochs ${epochs_i} --interval 120 --data_ratio ${ratio} --multigpu
      sleep ${SLEEP_INTERVAL}
   done
done


