clc
clear

data=readtable('Daily Survey.xlsx');
data(:,1)=[];
data.Properties.VariableNames{'x_____________'} = 'date';
data.Properties.VariableNames{'x_________________________'} = 'subject';
data.Properties.VariableNames{'x______1'} = 'brand';
data.Properties.VariableNames{'x____'} = 'worktime';

for i=1:length(data.brand)

    switch data.brand{i,1}
        
        case '나이키 베이퍼 줌'
        data.brand{i,1}=1;
            
        case '아디다스 바리케이드'
        data.brand{i,1}=2;    
            
        case '휠라 엑시루스 3'
        data.brand{i,1}=3;
            
        case '휠라 엑시루스 2'
        data.brand{i,1}=4;
            
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if length(data.worktime{i,1})==3   %%% 글자 수 3개 
        
        data.worktime{i,1}=str2num(data.worktime{i,1}(1));          
        
    elseif length(data.worktime{i,1})==6    
       
        data.worktime{i,1}=6.5;
        
    elseif length(data.worktime{i,1})==7
        
        if data.worktime{i,1}=='운동시간 없음'
            
            data.worktime{i,1}=0;
            
        else
        
            data.worktime{i,1}=str2num(data.worktime{i,1}(1)) + 0.5;
            
        end
       
    end

    ex_data(i,1)=str2num(data.date{i,1}([1;4;5]));  %%%% date
    
    ex_data(i,2)=data.subject(i,1);     %%%% subject
    
    ex_data(i,3)=data.brand{i,1};       %%%% brand
   
    ex_data(i,4)=data.worktime{i,1};     %%%% worktime
        
end

[row, column]=find(ex_data(:,2)==1);
pross_data.s1=ex_data(row(:,1),[1,3,4]);        %%% 1: date, 2 : brand 3: worktime

[row, column]=find(ex_data(:,2)==2);
pross_data.s2=ex_data(row(:,1),[1,3,4]);

[row, column]=find(ex_data(:,2)==3);
pross_data.s3=ex_data(row(:,1),[1,3,4]);

[row, column]=find(ex_data(:,2)==4);
pross_data.s4=ex_data(row(:,1),[1,3,4]);

[row, column]=find(ex_data(:,2)==5);
pross_data.s5=ex_data(row(:,1),[1,3,4]);

% [a,b]=size(ex_data);
% for i=1:b;
% [row, column]=find(ex_data(:,2)==i);
% ['pross_data.s',str2num(i)]=row(:,1);
% end

