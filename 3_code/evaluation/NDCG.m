function [ndcg_value, ndcg] = NDCG(result, stand, top_n)
[genes, phens] = size(stand);
[~, rank] = sort(result, 2, 'descend');
rank = rank .* stand;
rank(rank == 0) = phens + 1;
rank = sort(rank, 2);
ground_truth = sort(stand, 2, 'descend');
ground_truth = ground_truth(:, 1:top_n);
normalizer = zeros(1, genes);
dcg = zeros(1, genes);
for i = 1:genes
    for j = 1:top_n
        normalizer(i) = normalizer(i) + ground_truth(i, j)/log(j+1);
        if rank(i, j) <= top_n
            dcg(i) = dcg(i) + 1/log(rank(i, j)+1);
        end
    end
end
ndcg = dcg./normalizer;
ndcg_value = mean(ndcg);
%NDCG Summary of this function goes here
%   Detailed explanation goes here
end

