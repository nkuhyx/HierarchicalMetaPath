dir = '../../2_useful_data/';
pathname = '../prepared_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-matrix-%%%%%%%%%%%%%%%%%%%%

%---------------------------------------mmu----------------------
%mmu_mp_mgi
%mmu_mp_mgi,row:mp,col:mgi
mmu_mp_mgi_filename = 'Mus_gp_2016_2_21.txt';
[mmu_mp_mgi,mmu_mgi_mp_row,mmu_mp_mgi_col] = build_matrix(mmu_mp_mgi_filename,pathname);
save([dir 'matrix.mat'],'mmu_mp_mgi');
save([dir 'index.mat'],'mmu_mgi_mp_row','mmu_mp_mgi_col');

%mmu_mgi_go
%mmu_mgi_go,row:mgi,col:go
mmu_mgi_go_filename = 'mgi_go_2016_2_18.txt';
[mmu_mgi_go,mmu_mgi_go_row,mmu_mgi_go_col] = build_matrix(mmu_mgi_go_filename,pathname);
save([dir 'matrix.mat'],'mmu_mgi_go','-append');
save([dir 'index.mat'],'mmu_mgi_go_row','mmu_mgi_go_col','-append');

%mmu_ncbi_ncbi
%mmu_ncbi_ncbi,row:ncbi,col:ncbi
mmu_ncbi_ncbi_filname = 'Mus_ppi_2016_2_21.txt';
[mmu_ncbi_ncbi,mmu_ncbi_ncbi_row,mmu_ncbi_ncbi_col] = build_matrix(mmu_ncbi_ncbi_filname,pathname);
save([dir 'matrix.mat'],'mmu_ncbi_ncbi','-append');
save([dir 'index.mat'],'mmu_ncbi_ncbi_row','mmu_ncbi_ncbi_col','-append');



%----------------------------------------hsa----------------------
%hsa_omimg_omimp
%hsa_omimg_omimp,row:omimg,col:omimp
hsa_omimg_omimp_filename = 'human_gp_omim_omim_2016_2_24.txt';
[hsa_omimg_omimp,hsa_omimg_omimp_row,hsa_omimg_omimp_col] = build_matrix(hsa_omimg_omimp_filename,pathname);
save([dir 'matrix.mat'],'hsa_omimg_omimp','-append');
save([dir 'index.mat'],'hsa_omimg_omimp_row','hsa_omimg_omimp_col','-append');

%hsa_ncbi_go
%hsa_ncbi_ncbi,row:ncbi,col:ncbi
hsa_ncbi_go_filename = 'human_ncbi_go_2016_2_22.txt';
[hsa_ncbi_go,hsa_ncbi_go_row,hsa_ncbi_go_col] = build_matrix(hsa_ncbi_go_filename,pathname);
save([dir 'matrix.mat'],'hsa_ncbi_go','-append');
save([dir 'index.mat'],'hsa_ncbi_go_row','hsa_ncbi_go_col','-append');

%hsa_ncbi_ncbi
%hsa_ncbi_ncbi,row:ncbi,col:ncbi
hsa_ncbi_ncbi_filename = 'Human_ppi_2016_2_21.txt';
[hsa_ncbi_ncbi,hsa_ncbi_ncbi_row,hsa_ncbi_ncbi_col] = build_matrix(hsa_ncbi_ncbi_filename,pathname);
save([dir 'matrix.mat'],'hsa_ncbi_ncbi','-append');
save([dir 'index.mat'],'hsa_ncbi_ncbi_row','hsa_ncbi_ncbi_col','-append');



%%%%%%%%%%%%%%%%%-map-%%%%%%%%%%%%%%%%%%%%
mgi2ncbi_filename = 'mgi_ncbi_2016_2_21.txt';
mgi2ncbi = build_map(mgi2ncbi_filename,pathname);
save([dir 'map.mat'],'mgi2ncbi');

omim2ncbi_filename = 'omim2ncbi_merge_2016_2_24.txt';
omim2ncbi = build_map(omim2ncbi_filename,pathname);
save([dir 'map.mat'],'omim2ncbi','-append');




