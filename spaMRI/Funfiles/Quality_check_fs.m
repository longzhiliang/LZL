clear all;
%%%%%%%%%%%%% Quality control
global FREESURFER_HOME
global SUBJECTS_DIR

FREESURFER_HOME = '/usr/local/freesurfer';
SUBJECTS_DIR    = '/mnt/hgfs/VM_ShareFolders/FS_course_data/Test/data';
OUTDIR          = '/mnt/hgfs/VM_ShareFolders/FS_course_data/Test/out';

TalSlices       = 75:15:195;
SkullSlices     = 75:15:195;

addpath([FREESURFER_HOME,filesep,'matlab']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Env  = sprintf('export FREESURFER_HOME=%s;export SUBJECTS_DIR=%s;source $FREESURFER_HOME/SetUpFreeSurfer.sh; \n',FREESURFER_HOME,SUBJECTS_DIR);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subs            = dir(SUBJECTS_DIR);
for i=1:length(subs)
    subjects_name = subs(i).name;
    if  ~isequal(subjects_name,'fsaverage') && isdir([SUBJECTS_DIR,filesep,subjects_name,filesep,'surf'])
        % talariach checking
        if ~exist([SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'transforms',filesep,'talairach.xfm'],'file')
            error('Can not find talariach transform: %s \n',[SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'transforms',filesep,'talairach.xfm']);
        end
        if ~exist([FREESURFER_HOME,filesep,'average',filesep,'mni305.cor.mgz'],'file')
            error('Can not find MNI template: %s \n',[FREESURFER_HOME,filesep,'average',filesep,'mni305.cor.mgz']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'orig.mgz'],'file')
            error('Can not find orig.mgz file: %s \n',[SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'orig.mgz']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name,filesep,'surf',filesep,'lh.white'],'file')
            error('Can not find lh.white file: %s \n',[SUBJECTS_DIR,filesep,subjects_name,filesep,'surf',filesep,'lh.white']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name,filesep,'surf',filesep,'rh.white'],'file')
            error('Can not find rh.white file: %s \n',[SUBJECTS_DIR,filesep,subjects_name,filesep,'surf',filesep,'rh.white']);
        end
        
        xfm                   = fs_read_talairach([SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'transforms',filesep,'talairach.xfm']);
        mri305                = MRIread([FREESURFER_HOME,filesep,'average',filesep,'mni305.cor.mgz']);
        volmni                = mri305.vol;
        mriorig               = MRIread([SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'orig.mgz']);
        white_lh              = freesurfer_read_surf([SUBJECTS_DIR,filesep,subjects_name,filesep,'surf',filesep,'lh.white']);
        white_rh              = freesurfer_read_surf([SUBJECTS_DIR,filesep,subjects_name,filesep,'surf',filesep,'rh.white']);
        
        ras_lh                = xfm*mriorig.vox2ras*inv(mriorig.tkrvox2ras)*[white_lh,ones(size(white_lh,1),1)]';
        ras_lh                = inv(mri305.tkrvox2ras)*[ras_lh',ones(size(ras_lh',1),1)]';
        ras_lh                = ras_lh(1:3,:)';
        ras_rh                = xfm*mriorig.vox2ras*inv(mriorig.tkrvox2ras)*[white_rh,ones(size(white_rh,1),1)]';
        ras_rh                = inv(mri305.tkrvox2ras)*[ras_rh',ones(size(ras_rh',1),1)]';
        ras_rh                = ras_rh(1:3,:)';
        ras_all               = [ras_lh;ras_rh];
        clear ras_lh ras_rh mri305 white_lh white_rh
        
        for islice = TalSlices
            % coronal view
            A                 = squeeze(volmni(:,:,islice));
            B                 = ras_all(round(ras_all(:,3)) == islice,[1,2]);
            H                 = figure;
            imagesc(A); colormap(gray); hold on; plot(B(:,1),B(:,2),'g.');
            axis equal
            axis off
            print(H,'-dtiff',[OUTDIR,filesep,['Tal_',subjects_name,'_coronal_',num2str(islice),'.tif']]);
            close(H); clear A B H
            
            % axial view
            A                 = squeeze(volmni(islice,:,:));
            B                 = ras_all(round(ras_all(:,2)) == islice,[1,3]);
            B(:,2)            = size(A,1) - B(:,2);
            H                 = figure;
            imagesc(fliplr(A)'); colormap(gray); hold on; plot(B(:,1),B(:,2),'g.');
            axis equal
            axis off
            print(H,'-dtiff',[OUTDIR,filesep,['Tal_',subjects_name,'_axial_',num2str(islice),'.tif']]);
            close(H); clear A B H
            
            % sagittal view
            A                 = squeeze(volmni(:,islice,:));
            B                 = ras_all(round(ras_all(:,1)) == islice,[2,3]);
            H                 = figure;
            imagesc(A); colormap(gray); hold on; plot(B(:,2),B(:,1),'g.');
            axis equal
            axis off
            print(H,'-dtiff',[OUTDIR,filesep,['Tal_',subjects_name,'_sagital_',num2str(islice),'.tif']]);
            close(H); clear A B H
        end
        
        %% skullstrip checking
        if ~exist([SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'brainmask.mgz'],'file')
            error('Can not find brainmask.mgz file: %s \n',[SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'brainmask.mgz']);
        end
        brainmask             = MRIread([SUBJECTS_DIR,filesep,subjects_name,filesep,'mri',filesep,'brainmask.mgz']);
        brainmask             = brainmask.vol;
        for islice = SkullSlices
            % coro view
            A                 = squeeze(brainmask(:,:,islice));
            H                 = figure;
            imagesc(A); colormap(gray); axis equal; axis off
            print(H,'-dtiff',[OUTDIR,filesep,['Skull_',subjects_name,'_coronal_',num2str(islice),'.tif']]);
            close(H); clear A H
            
            % ax view
            A                 = squeeze(brainmask(islice,:,:));
            H                 = figure;
            imagesc(fliplr(A)'); colormap(gray); axis equal; axis off
            print(H,'-dtiff',[OUTDIR,filesep,['Skull_',subjects_name,'_axial_',num2str(islice),'.tif']]);
            close(H); clear A H
            
            % sagittal view
            A                 = squeeze(brainmask(:,islice,:));
            H                 = figure;
            imagesc(A); colormap(gray); axis equal; axis off
            print(H,'-dtiff',[OUTDIR,filesep,['Skull_',subjects_name,'_sagital_',num2str(islice),'.tif']]);
            close(H); clear A H
        end
        
        %% surface checking
        
        % surface checking (lh)
        fid                   = fopen([SUBJECTS_DIR,filesep,'Tksurfer_lh.tcl'],'a+');
        fprintf(fid,'make_lateral_view\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_lh_lateral.tiff']);
        fprintf(fid,'rotate_brain_y 180\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_lh_medial.tiff']);
        fprintf(fid,'rotate_brain_x 90\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_lh_inferior.tiff']);
        fprintf(fid,'rotate_brain_x 190\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_lh_superior.tiff']);
        fprintf(fid,'exit');
        fclose(fid);
        command               = ['tksurfer ',subjects_name,' lh inflated -tcl ',[SUBJECTS_DIR,filesep,'Tksurfer_lh.tcl']];
        unix(cat(2,Env,command));
        delete([SUBJECTS_DIR,filesep,'Tksurfer_lh.tcl']);
        clear command
        % rh surface
        fid                   = fopen([SUBJECTS_DIR,filesep,'Tksurfer_rh.tcl'],'a+');
        fprintf(fid,'make_lateral_view\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_rh_lateral.tiff']);
        fprintf(fid,'rotate_brain_y 180\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_rh_medial.tiff']);
        fprintf(fid,'rotate_brain_x 90\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_rh_inferior.tiff']);
        fprintf(fid,'rotate_brain_x 190\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_rh_superior.tiff']);
        fprintf(fid,'exit');
        fclose(fid);
        command               = ['tksurfer ',subjects_name,' rh inflated -tcl ',[SUBJECTS_DIR,filesep,'Tksurfer_rh.tcl']];
        unix(cat(2,Env,command));
        delete([SUBJECTS_DIR,filesep,'Tksurfer_rh.tcl']);
        clear command
        
        % white/pial checking
        fid                   = fopen([SUBJECTS_DIR,filesep,'Tkmedit.tcl'],'a+');
        fprintf(fid,'for { set slice 75 } { $slice < 195 } {incr slice 15} {\n');
        fprintf(fid,'SetSurfaceLineColor 0 0 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 0 1 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 1 0 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 1 1 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 0 2 1 0 0 \n');
        fprintf(fid,'SetSurfaceLineWidth 0 0 3 \n');
        fprintf(fid,'SetSurfaceLineWidth 1 0 3 \n');
        fprintf(fid,'SetSurfaceLineWidth 0 2 3 \n');
        fprintf(fid,'SetSurfaceLineWidth 1 2 3 \n');
        fprintf(fid,'SetOrientation 0 \n');
        fprintf(fid,'SetSlice $slice \n');
        fprintf(fid,'RedrawScreen \n');
        fprintf(fid,'SaveTIFF %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_coronal-$slice.tif']);
        fprintf(fid,'SetOrientation 1 \n');
        fprintf(fid,'SetSlice $slice \n');
        fprintf(fid,'RedrawScreen \n');
        fprintf(fid,'SaveTIFF %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_horizontal-$slice.tif']);
        fprintf(fid,'SetOrientation 2 \n');
        fprintf(fid,'SetSlice $slice \n');
        fprintf(fid,'RedrawScreen \n');
        fprintf(fid,'SaveTIFF %s \n',[OUTDIR,filesep,'Surface_',subjects_name,'_sagittal-$slice.tif']);
        fprintf(fid,'}\n');
        fprintf(fid,'exit');
        fclose(fid);
        command               = ['tkmedit ',subjects_name,' brainmask.mgz -surfs -tcl ',[SUBJECTS_DIR,filesep,'Tkmedit.tcl']];
        unix(cat(2,Env,command));
        delete([SUBJECTS_DIR,filesep,'Tkmedit.tcl']);
        clear command
    end
end