clc
clear
%%%%%%%%  04.10~04.15 [running shoes by kevin]
%%%%%%%%  피험자 1번 김태우 신발 13번을 신발 1번으로 체크해서 1번 신발이 두개임. 수정 필요
%%%%%%%%  subject.xlsx 파일 있어야 함 -> 피험자 이름


% raw_data=GetGoogleSpreadsheet('1Fx7dWE7lHLgy9eqXyQsnSRfpRhZhoUYPhOfF46A2R8Q');

raw_data=readtable('By Kevin & FPS.xlsx');
subject=readtable('subject.xlsx');
data=raw_data;


%%% 날짜를 연도,월,일 로만 나타내기. 

for i=1:length(data.x_____)
    
    data.x_____{i,1}=str2num(data.x_____{i,1}([3;4;6;7;9;10]));
    
end

%%% 피험자 이름 숫자로 바꾸기 (피험자 명 : subject 테이블)

for i = 1 : length(subject.name)
    
    for ii = 1 : length(data.Q1_1___________);
    
    switch data.Q1_1___________{ii,1}
        
        case subject.name{i,1}
            
            data.Q1_1___________{ii,1}=subject.no_(i,1);
    
    end
              
    end
    
end

%%% table 형식을 cell 형식으로 변환. 
data_cell=table2cell(data);          

%%% table 형식을 double 형식으로 변환.
for i=1: length(data_cell)
    for ii=1:23
    data_double(i,ii)=data_cell{i,ii}(1,1);
    end
end

%%% subject 별로..
for i= 1: length(subject.no_)
    
        [row,cloumn]=find(data_double(:,2)==i);
      
        for ii = 1 : length(row)
        
            for iii = 1 : 25
           
                eval(['subject_data.s',num2str(i),'{ii,iii}=data_cell{row(ii,1),iii};']);

            end
        
        end
    end
    
%%% shoes 별로
for i= 1: length(data.Q1_2____________)
    
        [row,cloumn]=find(data_double(:,3)==i);
      
        for ii = 1 : length(row)
        
            for iii = 1 : 25
           
                eval(['shoes_data.s',num2str(i),'{ii,iii}=data_cell{row(ii,1),iii};']);

            end
        
        end
    end