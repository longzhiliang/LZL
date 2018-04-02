function [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw)
%% generate para for colorbar 
% colorname         - colormap matrx or path-to colormap matrix
% default_pos_th_up - max pos
% default_pos_th_dw - min pos
% default_neg_th_up - max neg
% default_neg_th_dw - min neg
%
% colorA            - colorbar matrix
% xtick             - See matlab xtick
% xticklabel        - See matlab xticklabel
%%
if default_pos_th_up <= default_pos_th_dw
    default_pos_th_up        = 0;
    default_pos_th_dw        = 0;
end
if default_neg_th_dw <= default_neg_th_up
    default_neg_th_up        = 0;
    default_neg_th_dw        = 0;
end

if ischar(colorname)
    load(colorname);
    colorname                = whos('-file',colorname);
    colorname                = eval(colorname.name);
end

colorA                       = default_neg_th_up: (default_pos_th_up-default_neg_th_up)/1000 : default_pos_th_up;
colorx                       = ceil((default_neg_th_dw-min(colorA))/((max(colorA)-min(colorA))/size(colorname,1)));
if colorx == 0
    colorx                   = 1;
end
colory                       = ceil((default_pos_th_dw-min(colorA))/((max(colorA)-min(colorA))/size(colorname,1)));
colorname(colorx : colory,:) = 1;

colorx                       = ceil((default_neg_th_dw-min(colorA))/((max(colorA)-min(colorA))/length(colorA)));
colory                       = ceil((default_pos_th_dw-min(colorA))/((max(colorA)-min(colorA))/length(colorA)));
if colorx <= 1
    if colory > 1 && colory < length(colorA)
        xtick                = [1 colory length(colorA)];
        xticklabel           = {min(colorA) default_pos_th_dw max(colorA)};
    end
    if colory <= 1 || colory == length(colorA)
        xtick                = [1  length(colorA)];
        xticklabel           = {min(colorA)  max(colorA)};
    end
else
    if colorx ~= colory && colory < length(colorA)
        xtick                = [1 colorx colory length(colorA)];
        xticklabel           = {min(colorA) default_neg_th_dw default_pos_th_dw max(colorA)};
    end
    if colorx ~= colory && colory == length(colorA)
        xtick                = [1 colorx  length(colorA)];
        xticklabel           = {min(colorA) default_neg_th_dw  max(colorA)};
    end
    if colorx == colory && colory < length(colorA)
        xtick                = [1  colory length(colorA)];
        xticklabel           = {min(colorA)  default_pos_th_dw max(colorA)};
    end
    if colorx == colory && colory == length(colorA)
        xtick                = [1   length(colorA)];
        xticklabel           = {min(colorA)  max(colorA)};
    end
end
end