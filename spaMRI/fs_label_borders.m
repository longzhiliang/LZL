function borders = fs_label_borders(labelInd,faces,vertex,ext)
%% find a label's border
%   labelInd    -  label index [1234 123483 ...]
%   faces       -  M x 3 matrix. Each row is a triangle
%   vertex      -  white matter vertex
%   ext         -  extend the borders. 0-No extend
% Zhiliang Long
%%
if nargin < 4
    ext = 0;
end
for i=1:length(labelInd)
    if isempty(find(faces == labelInd(i), 1))
        error('Label index does not match surface faces. ');
    end
end

borders = [];
for i=1:length(labelInd)
    [ix, ~] = find(faces == labelInd(i));
    A        = faces(ix,:);
    A        = unique(A);
    A        = setdiff(A,labelInd);
    if ~isempty(A)
        borders = [borders,labelInd(i)];
    end
    clear A ix
end

% extention
if ext > 0
    inners         = setdiff(labelInd, borders);
    borders_coor   =  vertex(borders,:);
    inners_coor    =  vertex(inners,:);
    D              = fs_distance_matrix(borders_coor, inners_coor);
    [~,Dind]       = sort(D,2,'ascend');
    if ext > size(Dind,2)
        ext        = size(Dind,2);
    end
    Dind           = Dind(:,1:ext);
    Dind           = unique(Dind(:));
    borders        = [borders,inners(Dind)'];
    clear inners borders_coor inners_coor D Dind
end
end