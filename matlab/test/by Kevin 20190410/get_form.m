%%% get_form by kevin
%%% made by lee young seong 20190417
%%% data : questionnaire

clc
clear
%%%%%%%%  04.10~04.15 [running shoes by kevin]

% subject infor.
% no.	date	time	name.
subject = {'1','4.10.','13','김태우';
'2','4.10.','13','김희수';
'3','4.10.','16','도지민';
'4','4.10.','16','이동규';
'5','4.11.','13','이상훈';
'6','4.11.','13','이태환';
'7','4.11.','16','박진호';
'8','4.11.','16','연도현';
'9','4.12.','9','박성주';
'10','4.12.','9','지주현';
'11','4.12.','13','최윤석';
'12','4.12.','13','채병훈';
'13','4.12.','16','배병산';
'14','4.12.','16','박근윤';
'15','4.15.','9','장호준';
'16','4.15.','9','이동엽';
'17','4.15.','13','조성제';
'18','4.15.','13','금영환';
'19','4.15.','16','기병수';
'20','4.15.','16','신원학'};

% 신발 갯수
shoes_num = 18;

% excel 파일에서 불러오기.
raw_data=importdata('By Kevin & FPS(응답).xlsx');
data=raw_data.textdata;
data(2:end,3:23)=num2cell(raw_data.data);

% importdat 외 또 다른 방법. 
%  [data_double,txtData]  = xlsread('By Kevin & FPS.xlsx');  % -> data_double 는 숫자만 인식하는 double 형식 / txtData는 문자를 인식한 cell 형식  
%  data=txtData; data(2:end,3:23)=num2cell(raw_data.data);   % -> 숫자(double형식) 와 문자(cell형식)를 data(cell 형식)으로 통합


%%% 날짜를 연도,월,일 로만 나타내기. 

for i=2:length(data)
    
    data{i,1}=str2num(data{i,1}([3;4;6;7;9;10]));
    
end

%%% subject별, shoes 별로 나누기.
%%% subject 별로..

for i = 1 : length(subject)
    
    [row,cloumn] = find(strcmp(data(:,2),subject{i, 4}));     % find 문자 할때는 strcmp 사용! 또는 strfind

    eval(['subject_data.s',num2str(i),'=data(row(:,1),:);']);
    eval(['subject_data.s',num2str(i),'(:,2)=[];']);

end

%%% shoes 별로..
for i = 1 : shoes_num
    for ii = 2: length(data)
        aaa(ii,1)=data{ii,3}(1,1); 
        [row,cloumn] = find(aaa(:,1)==i);
        eval(['shoes_data.s',num2str(i),'=data(row(:,1),:);']);
    end
    eval(['shoes_data.s',num2str(i),'(:,3)=[];']);
end
