%%% funnign sheos by kevin
%%% data : Force, Marker, Angle, EMG 

clc
clear

info.path='C:\Users\user\Documents\MATLAB\qtm test\s1s2tr.mat';
raw=openmat(info.path);

% clc
% clearvars -except raw
% info.path='C:\Users\user\Documents\MATLAB\qtm test\s1s2tr.mat';

event.event_force=getstep(raw);
event.event_marker=round(getstep(raw)/10);
info.marker_name=fieldnames(raw.marker);
info.angle_name=fieldnames(raw.angle);

% EMG info.channel
% subject_no.	info.channel
info.emg_ch = [1, 17; 2,18; 
3, 19; 4, 20; 
5,17; 6,18; 
7,29; 8,20; 
9,17;10,18; 
11,17; 12,18; 
13, 19; 14,20;
15,17; 16,18;
17,17; 18,18;
19, 17; 20,18];

%%% Force
 for i = 1 : length(event.event_force)
    
    eval(['event.force.e',num2str(i),'=transpose(raw.force(1).Force(:,event.event_force(i,1):event.event_force(i,2)));']); 
    
 end
 
%%% Marker
 for i = 1 : length(event.event_marker)
          
          for ii= 1: length(info.marker_name)
              
              eval(['event.marker.e',num2str(i),'.',info.marker_name{ii,1},'= raw.marker','.',info.marker_name{ii,1},'(event.event_marker(i,1):event.event_marker(i,2),:);']);
        
      end
      
 end

 %%% Angle
 for i = 1 : length(event.event_marker)
          
          for ii= 1: length(info.angle_name)
              
              eval(['event.angle.e',num2str(i),'.',info.angle_name{ii,1},'= raw.angle','.',info.angle_name{ii,1},'(event.event_marker(i,1):event.event_marker(i,2),:);']);
        
      end
      
 end
 
%%% EMG
%%% EMG channel 구하기. 
info.ch=strsplit(char(raw.f_name),'s');
info.ch=str2num(info.ch{2});  
info.ch=info.emg_ch(info.ch,2);
info.f_p=0;

%%% Right EMG 구하기
for i = 1 : length(event.event_force)-1
    info.e_emg=transpose(raw.analog(info.ch,event.event_force(i,1)+270:event.event_force(i,2)+270));
    
    info.f_p=mean(findpeaks(abs(info.e_emg), 'SortStr','descend','NPeaks',50));
  
    if info.f_p > 0.1    
        eval(['event.emg.e',num2str(i),' = info.e_emg']); 
    end
    
end
