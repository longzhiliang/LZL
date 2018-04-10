function fs_run_unix(commands)
% This function is to run freesurfer commands
% Input-
%       commands          :  the freesurfer commands. e.g. recon-all ......
%%
% Programmed by Zhiliang Long, 2017/07/18
global FREESURFER_HOME
global SUBJECTS_DIR

if ~exist([FREESURFER_HOME,filesep,'SetUpFreeSurfer.sh'],'file')
    error('SetUpFreeSurfer.sh does not exist under the FREESURFER_HOME folder');
end
Env  = sprintf('export FREESURFER_HOME=%s;export SUBJECTS_DIR=%s;source $FREESURFER_HOME/SetUpFreeSurfer.sh; \n',FREESURFER_HOME,SUBJECTS_DIR);
C    = cat(2,Env,commands);
unix(C);
clear C Env
end