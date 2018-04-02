function statistic_command(fsgd,mtx,measure, hemi, label,model,outname)
%% performing statistical analy using command 
%  fsgd            - *.fsgd file
%  mtx             - *.mtx contrast files.e.g. {mtx1,mtx2,...}
%  measure         - meansurement. e.g. thickness.fwhm10.fsaverage
%  hemi            - lh or rh
%  label           - label file (mask) 
%  model           - DODS or DOSS
%  outname         - output name
%  
%  Author: Zhiliang Long, 2017/08/16
%%
commands      = ['mris_preproc ',' --fsgd ',fsgd,' --cache-in ',measure,' --target fsaverage ', ' --hemi ',hemi,' --out ',outname,'.mgh;'];
commands     = cat(2,commands,['mri_glmfit ',' --y ',outname,'.mgh', ' --fsgd ',fsgd,' ',model,' ']);
for i = 1:length(mtx)
    commands = cat(2,commands,[' --C ',mtx{i}]);
end
commands     = cat(2,commands,[' --label ',label,' --surf fsaverage ',hemi, ' --glmdir ',outname,';']);
fs_run_unix(commands);
clear commands i
end