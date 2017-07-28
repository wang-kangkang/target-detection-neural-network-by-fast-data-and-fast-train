clear all
names=dir('../');
names([1:2,end])=[];

index=0;
for i=1:size(names,1)
    index=index+1;
    img_names=dir(['../',names(i).name,'/imgs']);
    img_names(1:2)=[];
    tmp_imgs(:,:,:)=imread(['../',names(i).name,'/imgs/',img_names(1).name]);
    tmp_labels(:,:,:)=imread(['../',names(i).name,'/labels/',img_names(1).name]);
    imwrite(tmp_imgs,['./example_show/',names(i).name,'.jpg'],'jpg');
    subplot(1,2,1);
    imshow(tmp_imgs);
    subplot(1,2,2);
    imshow(tmp_labels);
    pause(1);
end