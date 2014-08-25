function img_r = same_dim (imagen_g)

% Example:
% Subplot (2,1,1), imshow (imagen_g), title ('Image mx n')
% Subplot (2,1,2), imshow (img_r), title ('Image 42 x 24')
 
img_r = imresize (imagen_g,[42 24]);
end