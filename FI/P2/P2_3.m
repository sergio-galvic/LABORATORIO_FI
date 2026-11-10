[I]=imread('cameraman.tif');
subsampx=4; subsampy=4;
I_sub=I(1:subsampy:end,1:subsampx:end); % Simulamos muetreo simple
I_sub2=blockproc(double(I)/255, [subsampy, subsampx],@(blockstruct) (mean(blockstruct.data(:)))); % Simulamos la adquisición del sensor


figure(2)
subplot(1,3,1)
imshow(I)
subplot(1,3,2)
%imshow(I_sub)
imshow(imresize(I_sub,[size(I,1), size(I,2)])) % con esto interpolamos para conservar el tamaño si lo hacemos asimétrico
subplot(1,3,3)
%imshow(I_sub2)
imshow(imresize(I_sub2,[size(I,1),size(I,2)]))

% figure(2)
% %imshow(I_sub)
%
% figure(3)
% %imshow(I_sub)

%clear all; close all;

%Cambio niveles cuantificación
I_dob=double(I)/255;
bit_depth = 2;
N_cuant = 2^bit_depth;
I_cuant = fix(N_cuant*I_dob)/(N_cuant-1);



%otra opcion

[I_cuant2 map]=gray2ind(I_dob, N_cuant);

figure(1);
subplot(1,3,1);
imshow(I_dob);
subplot(1,3,2);
imshow(I_sub)
%imshow(I_cuant);
subplot(1,3,3);
imshow(I_cuant2);

%esto es nuestro son pruebas borrar luego
P=blockproc(double(I)/255, [subsampy, subsampx],@(blockstruct) (blockstruct.data(:))); % Simulamos la adquisición del sensor
p = im2double(P);
fprintf(p);
%hasta aqui