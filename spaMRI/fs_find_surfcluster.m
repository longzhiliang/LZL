function [clusterlabel,label] = fs_find_surfcluster(vol,faces)
%% find surface clusters.
%   Input:
%        vol          -  thresholded surface measurement. e.g. thickness, area (Nvertex x 1)
%                        vol can be obtained using read_mgh function
%        faces        -  surface triangular faces (M x 3)
%                        faces can be obtained using freesurfer_read_surf function
%   Output:
%        clusterlabel - assignment of each vertex to a cluster
%        label        - cluster labels

% Zhiliang Long, 2017-5-4
%%
if length(vol) ~= max(faces(:))
    error('Input arguments error');
end

vol_nonezero_ind     = find(vol ~= 0);
clusterlabel         = zeros(length(vol),1);
label                = 1;
for i=1:length(vol_nonezero_ind)
    [ix,~]           = find(faces == vol_nonezero_ind(i));
    ix               = faces(ix,:);
    ix               = ix(:);
    ix               = unique([ix;vol_nonezero_ind(i)]); % adjacent neibours of vertex i (including itself)
    ix(vol(ix) == 0) = []; % exclude those neibours whose intensity values are zero
    
    if ~isempty(ix)
        if ~any(clusterlabel(ix)) % new cluster detected
            clusterlabel(ix) = label;
            label    = label + 1;
        else
            A        = clusterlabel(ix);
            A        = unique(A);
            A(A==0)  = [];
            clusterlabel(ix) = min(A);
            for j=1:length(A)
                clusterlabel(clusterlabel == A(j)) = min(A);
            end
            clear A i j
        end
    end
    clear ix
end
label                = unique(clusterlabel);
label(label == 0)    = [];
end