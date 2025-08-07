Specific to LoD 9.16.1 early adopter lab
- After the setup script, cluster1 has "svmSrc" and cluster2 has "svmDst" which are peered.
- cluster1 has aggregates "cluster1_01_SSD_1" and "cluster1_02_SSD_2".
- cluster2 has aggregates "cluster2_01_aggr" and "cluster2_02_aggr".
- We can allow folks to run multiple labs if we keep volume names specific to the lab. You can also add "clean-up" files and instruct folks to run that if you want.

We are not limited to using the 9.16.1 lab, but if you want to use a different one it will need to be spelled out in the confluence and a separate setup script should get created.
