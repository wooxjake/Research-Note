function qtm=openmat(path)

% 20190415
% by woo jeong hyun
% function to open matfile from qtm

x=load(path);
x_n=fieldnames(x);
qtm.f_name=x_n;
eval(['x=x.' x_n{1,1}]);

%% basic_info
qtm.file=x.File;
qtm.marker_framerate=x.FrameRate;

%% Force & Analog

if isfield(x,'Force')
    qtm.force=x.Force;
end

if isfield(x,'Analog')
    qtm.analog=x.Analog.Data;
end
    
%% Marker

if isfield(x,'Trajectories')

    m_row=x.Trajectories.Labeled.Data;
    m_label_name=x.Trajectories.Labeled.Labels;

    m_row_s=size(m_row);
    % m_row_1(:,3)=m_row
    for i=1:m_row_s(1)

        for ii=1:m_row_s(3)

            eval([ 'qtm.marker.' m_label_name{i} '(ii,:) = m_row(i,1:3,ii);']);

        end

    end

end

%% 6Dof


if isfield(x,'RigidBodies')

    m_row=x.RigidBodies.RPYs;
    m_label_name=x.RigidBodies.Name;

    m_row_s=size(m_row);
    % m_row_1(:,3)=m_row
    
    for i=1:m_row_s(1)

        for ii=1:m_row_s(3)

            eval([ 'qtm.angle.' m_label_name{i} '(ii,:) = m_row(i,1:3,ii);']);

        end

    end

    
end


end
