train_log_file = 'sealion_log.txt' ; 
[~, string_output] = dos(['type ' , train_log_file ]) ; 
pat='Train net output #0: loss = .*? (';  
o1=regexp(string_output,pat,'start');%��'start'����ָ�����o1Ϊƥ��������ʽ���Ӵ�����ʼλ��  
o2=regexp(string_output,pat,'end');%��'start'����ָ�����o1Ϊƥ��������ʽ���Ӵ��Ľ���λ��  
o3=regexp(string_output,pat,'match');%��'match'����ָ�����o2Ϊƥ��������ʽ���Ӵ�   
                                         
loss=zeros(1,size(o1,2));  
for i=1:size(o1,2)  
    loss(i)=str2num(string_output(o1(1,i)+28:o2(1,i)-2));  
end  
plot(loss) 
title('loss');
% hold on;
% 
% pat='Test net output #0: loss = .*? ('; 
% o1=regexp(string_output,pat,'start');%��'start'����ָ�����o1Ϊƥ��������ʽ���Ӵ�����ʼλ��  
% o2=regexp(string_output,pat,'end');%��'start'����ָ�����o1Ϊƥ��������ʽ���Ӵ��Ľ���λ��  
% o3=regexp(string_output,pat,'match');%��'match'����ָ�����o2Ϊƥ��������ʽ���Ӵ� 
% loss2=zeros(1,size(o1,2));  
% for i=1:size(o1,2)  
%     loss2(i)=str2num(string_output(o1(1,i)+28:o2(1,i)-2));  
% end  
% loss2=imresize(loss2,[1,size(loss,2)]);
% plot(loss2) 
