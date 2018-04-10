clear all;

astr_curv             = 'F:\VM_ShareFolders\FS_course_data\Course_results_statistical_analy\fsaverage\surf\lh.curv';
[v_curv, fnum]        = read_curv(astr_curv);

img                   = 'F:\VM_ShareFolders\FS_course_data\Course_results_statistical_analy\fsaverage\surf\lh.inflated';
[vertices, faces]     = freesurfer_read_surf(img);
vertices              = single(vertices);
faces                 = int32(faces); 

load('F:\VM_ShareFolders\softwares\FS_gui\ColorMats\gray.mat');
colorname = h;

A = colorname(21:end-20,:); 
B = colorname(21:end-20,:); 
B(1:5,:) = [];

colorname = [A;B];
clear A B

Cdata                        = zeros(length(vertices),3);
A                            = (v_curv - min(v_curv))./(max(v_curv) - min(v_curv));
A                            = ceil(A*size(colorname,1));
A(A>size(colorname,1))       = size(colorname,1);
for i=1:size(colorname,1)
    Cdata(find(A == i),:)    = repmat(colorname(i,:),length(find(A==i)),1);
end

patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
axis equal; 
view(270,0);
% demcmap(v_curv,2);
camlight('headlight');lighting phong;material dull % shiny, dull, metal

