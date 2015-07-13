% Image Normalization

function img = normal(codeI);
codeI = double(codeI);
[r c] = size(codeI);
img = zeros(r,c);
min_codeI = min(min(codeI));
max_codeI = max(max(codeI));
for i = 1 : r
    for j = 1 : c
        img(i,j) = 255*(codeI(i,j)-min_codeI)/(max_codeI-min_codeI);
    end
end
img = uint8(img);
        