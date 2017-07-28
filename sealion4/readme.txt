I use windows caffe,if you are familiar with linux caffe,you can use my network and data to train in linux by yourself.


I participate kaggle's NOAA sealion detection competiton.Although I didn't get a good place, but I design
a new neural network,which can detection sealion only using twenty or dozens of sealion image.And training fast,and you can using this way to detect car,detect birds and so on.because this network only need dozens of  image,so you can shoot your target,and generate data by handwork very fast.

in my windows caffe,you can detect sealion by using the following steps:
1:copy this filefolder(sealion4) to caffe's examples filefolder
2:the caffemodel is exist,you can run net_test.m and can see a detection example
3:if you want to train by yourself,you should run datas/001/generate_data.m,datas/002/generate_data.m .....
  datas/013/generate_data.m, after this, you should run datas/collect/collect.m,and you will get the train data and test data(h5 format),copy both of this to sealion4,and run train_sealion_withlog.bat, you will being training.

if you have any questions,email 597642580@qq.com

All rights reserved