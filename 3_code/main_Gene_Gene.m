path(path,'Hierarchy_Meta_Path')
path(path,'evaluation')
path(path,'../2_useful_data')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-load-%%%%%%%%%%%%%%%%%%%%%%%%%%
load('matrix.mat','mmu_mp_mgi','mmu_mgi_go');
load('index.mat','mmu_mp_mgi_row','mmu_mp_mgi_col','mmu_mgi_go_row','mmu_mgi_go_col');
load('map.mat','go_level');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-G_G_sim-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hierarchy_go = go_level(:,2);
hierarchy_go_row = go_level(:,1);


% mmu_mgi_go = full(mmu_mgi_go);
% mmu_mgi_go = gpuArray(mmu_mgi_go);
% mmu_mp_mgi = gpuArray(mmu_mp_mgi);
% hierarchy_go = gpuArray(hierarchy_go);


[mmu_mgi_go_aligned , mmu_mgi_mp_aligned , mgi_index] = Row_Index_Alignment(mmu_mgi_go , mmu_mp_mgi' , mmu_mgi_go_row , mmu_mp_mgi_col);
[mmu_go_mgi_aligned , hierarchy_go_aligned , go_index] = Row_Index_Alignment(mmu_mgi_go_aligned' , hierarchy_go , mmu_mgi_go_col , hierarchy_go_row);

hierarchy_go_aligned_weight = Kernel_Weight(hierarchy_go_aligned);
Nohierarchy_go_aligned_weight = ones(size(go_index,1),1);

%Nohierarchy_go_aligned_weight = gpuArray(Nohierarchy_go_aligned_weight);

[G_G_sim_Hierarchy] = Hierarchy_Meta_Path(mmu_go_mgi_aligned' , mmu_go_mgi_aligned , hierarchy_go_aligned_weight);
[G_G_sim_NoHierarchy] = Hierarchy_Meta_Path(mmu_go_mgi_aligned' , mmu_go_mgi_aligned , Nohierarchy_go_aligned_weight);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-evalutaion-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%divide all gene into n part
n = 100;

[Result_Hierarchy] =  Recommend(G_G_sim_Hierarchy , mmu_mgi_mp_aligned , n);
[Result_NoHierarchy] =  Recommend(G_G_sim_NoHierarchy , mmu_mgi_mp_aligned , n);

top_n = 1000;
[Mean_AUC_Hierarchy,AUC_Hierarchy] = AUC(Result_Hierarchy  ,mmu_mgi_mp_aligned , top_n);
[Mean_AUC_NoHierarchy,AUC_NoHierarchy] = AUC(Result_NoHierarchy  ,mmu_mgi_mp_aligned , top_n);
MAP_Hierarchy = MAP(Result_Hierarchy, mmu_mgi_mp_aligned);
MAP_NoHierarchy = MAP(Result_NoHierarchy, mmu_mgi_mp_aligned);

