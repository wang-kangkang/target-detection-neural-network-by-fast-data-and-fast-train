train_log_file = 'sealion_log.txt' ; 
[~, string_output] = dos(['type ' , train_log_file ]) ; 
pat='Train net output #0: loss = .*? (';  
o1=regexp(string_output,pat,'start');%用'start'参数指定输出o1为匹配正则表达式的子串的起始位置  
o2=regexp(string_output,pat,'end');%用'start'参数指定输出o1为匹配正则表达式的子串的结束位置  
o3=regexp(string_output,pat,'match');%用'match'参数指定输出o2为匹配正则表达式的子串   
                                         
loss=zeros(1,size(o1,2));  
for i=1:size(o1,2)  
    loss(i)=str2num(string_output(o1(1,i)+28:o2(1,i)-2));  
end  
plot(loss) 
title('loss');
% hold on;
% 
% pat='Test net output #0: loss = .*? ('; 
% o1=regexp(string_output,pat,'start');%用'start'参数指定输出o1为匹配正则表达式的子串的起始位置  
% o2=regexp(string_output,pat,'end');%用'start'参数指定输出o1为匹配正则表达式的子串的结束位置  
% o3=regexp(string_output,pat,'match');%用'match'参数指定输出o2为匹配正则表达式的子串 
% loss2=zeros(1,size(o1,2));  
% for i=1:size(o1,2)  
%     loss2(i)=str2num(string_output(o1(1,i)+28:o2(1,i)-2));  
% end  
% loss2=imresize(loss2,[1,size(loss,2)]);
% plot(loss2) 
