function [G_G_Sim] = Hierarchy_Meta_Path(Association_Fisrt , Association_Sec , weight)

%weight is a vector.

G_G_Sim_path = Association_Fisrt * diag(weight) *  Association_Sec;

[m,~] = size(G_G_Sim_path);

G_G_Sim = zeros(m,m);

for i = 1:m
    for j = 1:m
        G_G_Sim(i,j) = 2*G_G_Sim_path(i,j)/(G_G_Sim_path(i,i)+G_G_Sim_path(j,j));
    end
end

end

