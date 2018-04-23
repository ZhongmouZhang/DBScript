1. deal with deadlock, process hanging
2. log file need to be shrinked when it gets too big after running some SSIS package
3. Need to keep three copies of backup for now, user will give the growth estimate.
4. Run the benchmark query twice a week to make sure the BPP database is in good shape. The duration should be 
   less than 1 minute. If not, re-organize the relavant indexes or table. But it should be done after hours. 
   Trying to figure out regular maintenance plan. 