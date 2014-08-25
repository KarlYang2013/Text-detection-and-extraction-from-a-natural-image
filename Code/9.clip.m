function IMGN = clip (image)

% Crops a black background with white letter.

if ~islogical(image)
     image =im2bw(image, 0.99);
end
a = ~ image;
[f,c] = find (a);
lmaxc = max (c); lminc = min (c);
lmaxf = max (f); lminf = min (f);
IMGN = a (lminf: lmaxf, lminc: lmaxc); % Crops image
end
