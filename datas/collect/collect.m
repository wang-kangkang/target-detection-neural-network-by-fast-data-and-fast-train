clear all
names=dir('../');
names([1:2,end])=[];

train_imgs=zeros(64,64,3,0);
train_labels=zeros(64,64,1,0);
test_imgs=zeros(64,64,3,0);
test_labels=zeros(64,64,1,0);

for i=1:size(names,1)-1
    img_names=dir(['../',names(i).name,'/imgs']);
    img_names(1:2)=[];                            
    tmp_imgs=zeros(64,64,3,size(img_names,1));
    tmp_labels=zeros(64,64,1,size(img_names,1));
    for j=1:size(img_names,1)
        tmp_imgs(:,:,:,j)=imread(['../',names(i).name,'/imgs/',img_names(j).name]);
        tmp_labels(:,:,:,j)=imread(['../',names(i).name,'/labels/',img_names(j).name]);
        tmp_imgs(:,:,:,j)=tmp_imgs(:,:,:,j);
    end
    train_imgs(:,:,:,end+1:end+size(tmp_imgs,4)-60)=tmp_imgs(:,:,:,1:end-60);
    train_labels(:,:,:,end+1:end+size(tmp_imgs,4)-60)=tmp_labels(:,:,:,1:end-60);
    test_imgs(:,:,:,end+1:end+60)=tmp_imgs(:,:,:,end-59:end);
    test_labels(:,:,:,end+1:end+60)=tmp_labels(:,:,:,end-59:end);
end
train_imgs=255-train_imgs;
test_imgs=255-test_imgs;
my_write_to_hdf5('sealion_train.h5',train_imgs,train_labels);
my_write_to_hdf5('sealion_test.h5',test_imgs,test_labels);