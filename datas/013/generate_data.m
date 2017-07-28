clear all
img=imread('6237.jpg');
img=imresize(img,0.3,'bicubic');
img=double(img);
row=498;
col=690;

window_r=60;%标准大小55
hannwindow=zeros(131,131,3);
hannwindow(66-window_r:66+window_r,66-window_r:66+window_r,1)=hann(window_r*2+1)*hann(window_r*2+1)';
hannwindow(66-window_r:66+window_r,66-window_r:66+window_r,2)=hann(window_r*2+1)*hann(window_r*2+1)';
hannwindow(66-window_r:66+window_r,66-window_r:66+window_r,3)=hann(window_r*2+1)*hann(window_r*2+1)';
img(row-65:row+65,col-65:col+65,:)=img(row-65:row+65,col-65:col+65,:).*hannwindow;
img(row-65:row+65,col-65:col+65,:)=img(row-65:row+65,col-65:col+65,:).*hannwindow;
img(row-65:row+65,col-65:col+65,:)=img(row-65:row+65,col-65:col+65,:).*hannwindow;

label=zeros(size(img,1),size(img,2));
label(row,col,:)=255;
mywindow=fspecial('gaussian',[13,13],3);
label=conv2(label,mywindow,'same');
label=label/max(max(label));

index=0;
noise=30;
for i=1:700
    index=index+1;
    r_size=round((rand()-0.5)*2)*2+64;
    r_size_2=round(r_size/2);
    r_size_4=round(r_size/4);
    r1=round(rand()*r_size_2-r_size_4);
    r2=round(rand()*r_size_2-r_size_4);
    img1=img(row-r_size_2+r1:row+r_size_2-1+r1,col-r_size_2+r2:col+r_size_2-1+r2,:)+rand(r_size,r_size,3)*noise;
    label1=label(row-r_size_2+r1:row+r_size_2-1+r1,col-r_size_2+r2:col+r_size_2-1+r2,:);
    img1=imresize(img1,[64,64],'bicubic');
    label1=imresize(label1,[64,64],'bicubic');
    imwrite(img1/max(max(max(img1))),['./imgs/',num2str(1000000+index),'.jpg'],'jpg');
    imwrite(label1,['./labels/',num2str(1000000+index),'.jpg'],'jpg');
end