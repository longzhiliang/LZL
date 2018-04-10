function [surf] = fs_find_neighbors(surf)
% fs_read_surf - find neighboring relations between vertices in a surface
%
% [surf] = fs_find_neighbors(surf)
%
% Input:
% surf is a structure containg:
%   nverts: number of vertices
%   nfaces: number of faces (triangles)
%   faces:  vertex numbers for each face (3 corners)
%   coords: x,y,z coords for each vertex
%
% Output:
% surf is a structure containg:
%   nverts: number of vertices
%   nfaces: number of faces (triangles)
%   faces:  vertex numbers for each face (3 corners)
%   coords: x,y,z coords for each vertex
%   nbrs:   vertex numbers of neighbors for each vertex
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

funcname = 'fs_find_neighbors';

if ~isfield(surf, 'faces')
  fprintf('%s: error: input surf must contain faces\n',funcname);
  return;
end;

% compute the maximum degree of node -- number of edges = number of 
neighbors
fprintf('%s: finding number of nearest neighbors...',funcname); tic;
num_nbrs=zeros(surf.nverts,1);
for i=1:surf.nfaces
  num_nbrs(surf.faces(i,:))=num_nbrs(surf.faces(i,:))+1;
end
max_num_nbrs=max(num_nbrs);
t=toc; fprintf('done (%0.2f sec)\n',t);

% find nearest neighbors
fprintf('%s: finding nearest neighbors...',funcname); tic;
surf.nbrs=zeros(surf.nverts,max_num_nbrs);
for i=1:surf.nfaces
  for j=1:3
    vcur = surf.faces(i,j);
    for k=1:3
      if (j ~= k)
        vnbr = surf.faces(i,k);
        if find(surf.nbrs(vcur,:)==vnbr)
          ;
        else
          n_nbr = min(find(surf.nbrs(vcur,:) == 0));
          surf.nbrs(vcur,n_nbr) = vnbr;
        end;
      end;
    end;
  end;
end;
t=toc; fprintf('done (%0.2f sec)\n',t);

return