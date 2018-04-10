function [ResAx, ResAy] = fs_rescale_img(A,Direction)
% Rescale an image A along a given direction
%
% disp('Rescale the image......');

A = double(A~=0);
[xs,ys,zs] = size(A);

Rule = 0;
if isequal(Direction,'Axial')
    for id=1:zs
        M = squeeze(A(:,:,id))';
        Mx = find(sum(M,2));
        My = find(sum(M));
        if length(Mx)*length(My) > Rule
            Rule = length(Mx)*length(My);
            ResAx = Mx;
            ResAy = My;
        end
    end
    clear id M Mx My Rule
end
if isequal(Direction,'Coronal')
    for id=1:ys
        M = squeeze(A(:,id,:))';
        Mx = find(sum(M,2));
        My = find(sum(M));
        if length(Mx)*length(My) > Rule
            Rule = length(Mx)*length(My);
            ResAx = Mx;
            ResAy = My;
        end
    end
    clear id M Mx My Rule
end
if isequal(Direction,'Sagittal')
    for id=1:xs
        M = squeeze(A(id,:,:))';
        Mx = find(sum(M,2));
        My = find(sum(M));
        if length(Mx)*length(My) > Rule
            Rule = length(Mx)*length(My);
            ResAx = Mx;
            ResAy = My;
        end
    end
    clear id M Mx My Rule
end
end