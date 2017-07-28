clear all
addpath ../../matlab
model = './sealion_net_deploy.prototxt';
weights = './sealion_iter_6000.caffemodel';
%caffe.set_mode_gpu();
net=caffe.Net(model,weights,'test');  
% 
% data=h5read('./sealion_train.h5','/data');
% r=floor(rand()*3000+1);
% img=data(:,:,:,r);
% label=h5read('./sealion_train.h5','/label');
% label1=label(:,:,1,r);
% res=net.forward({img});
% subplot(2,2,1);imshow(img/255);subplot(2,2,2);imshow(res{1}/255);subplot(2,2,3);imshow(label1/255);title('label');subplot(2,2,4);mesh(res{1});

img=imread('./56.jpg');
img=imresize(img,0.3,'bicubic');
img2=img(501:1000,701:1200,:);
res=net.forward({255-img2});
subplot(1,2,1);imshow(uint8(img2));subplot(1,2,2);imshow(res{1},[]);
%subplot(1,2,1);imshow(uint8(img2));subplot(1,2,2);imshow(res{1},[]);
%subplot(1,2,1);imshow(img2);subplot(1,2,2);mesh(flipdim(res{1},1))
