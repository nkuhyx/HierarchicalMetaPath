function [ Result ] = Recommend( G_G_Sim , mmu_mgi_mp , n)

%divide into n part , each part has k genes.

[row_size,col_size] = size(mmu_mgi_mp);

k = floor(row_size/n);

Result = zeros(row_size,col_size);

for i = 1:(n-1)
    gene_begin = (i-1)*k+1;
    gene_end = i*k;
    mmu_mgi_mp_train = mmu_mgi_mp;
    mmu_mgi_mp_train(gene_begin:gene_end,:) = 0;
    Result_all = G_G_Sim*mmu_mgi_mp_train;
    Result(gene_begin:gene_end,:) = Result_all(gene_begin:gene_end,:);
end



end

