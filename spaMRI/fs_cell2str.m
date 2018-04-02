function s = fs_cell2str(cell)
%% cell2str function
%   cell   -  like {'Nvtx',12.34;14,'Vtxmax'};
%   s      - string
%  Author - Zhiliang Long
%%
null_string = 2;
space       = ' ';
s = [];
[m, n] = size(cell);
cell_length = zeros(m,n);
for i=1:m
    for j=1:n
        if isnumeric(cell{i,j})
            cell{i,j} = num2str(cell{i,j});
        end
        cell_length(i,j) = length(cell{i,j});
    end
end
cell_length = max(cell_length,[],1);

for i=1:m
    A = [];
    for j=1:n
        B = [cell{i,j},repmat(space,1,cell_length(j)+null_string-length(cell{i,j}))];
        A = cat(2,A,B);
        clear B
    end
    s = cat(1,s,A);
    clear A
end
end