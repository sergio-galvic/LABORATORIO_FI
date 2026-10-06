%Imagen degradada en naranja, estyo es parte de imagen, practica 1, parte 3
M=256;
N=256;


%Hue, h, tinte
%S, saturacion
%V=Valor
h = repmat(0.087, M, N);
s = ones(M, N);
v =repmat(linspace(0,1,N),M,1);


%ashora ya solo nos queda crear la imagen y representarla
%ahora estp ya es un array tridimensonal, por lo que tendremos tres capas,
%representando cada una h, s y v respectivamente

imagen(:,:,1)=h;
imagen(:,:,2)=s;
imagen(:,:,3)=v;

%hemos definido esto en hsv, pero imshow trabaja en rgb, por lo que tenemos
%que realizr una traduccion entres sistemas
imshow(hsv2rgb(imagen));

%vamos ahora con la segunda parte de la parte rtres de la practica 1 de la
%segundza parte de fsi

v = 0.5*ones(M, N);
[h s]=meshgrid(linspace(0,1,N),linspace(0,1,M));

%ahora creamos nuestra imagen a partir de ceros y rellenar los canales,
%luego llevar el sistema hsv al sistema rgb y representar
imagen = zeros(M,N,3);
imshow(hsv2rgb(imagen));


%para la siguiente parte utilizamos la funcion forest.tif
[I, map] = imread('forest.tif');
[I] = ind2rgb(I,map);
imshow(I);
[J]=rgb2gray(I);
imshow(J);

%%%%nop seu que estamos haciendo ahora, ya estoy cansado, son las ocho de
%%%%la trde
[M] = mean(I, 3);
[L]= 0.3*I(:,:,1)+0.59*I(:,:,2)+0.11*I(:,:,3);

figure;
subplot(2, 2, 1); imshow(I);
subplot(2, 2, 2); imshow(J);
subplot(2, 2, 3); imshow(M);
subplot(2, 2, 4); imshow(L);


%nos damos cuenta de que en board.tif, el campo colormap esta v acio

[I] = imread('board.tif');