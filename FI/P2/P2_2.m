close all;
clear all;
%% Lectura y reproducción de un video en formato mpeg
% Precarga la estructura de datos.
vidObj = VideoReader('testVideo.mpg');
s = struct('cdata', zeros(vidObj.Height, vidObj.Width, 3,'uint8'),'colormap', []);
numFrames = 0;
nframes=10;
Duration=vidObj.CurrentTime;
while numFrames<nframes
    numFrames = numFrames + 1;
    s(numFrames).cdata = readFrame(vidObj);
    Duration=vidObj.CurrentTime;
end
m=vidObj.Height;
n=vidObj.Width;
%%
vf=[];
%Repetición 10 veces de la primera imagen
  for i=1:nframes
      vf=[vf im2col(rgb2gray(s(1).cdata)',[1 1],'distinct')];
  end
%Trasponer frame para que el im2col lea por filas
%Primeros 10 frames
 %for i=1:nframes
  %   vf=[vf im2col(rgb2gray(s(i).cdata)',[1 1],'distinct')];
 %end

%%
 fimagen= vidObj.FrameRate     % es el framerate
 flinea= fimagen * m   % fimagen * height
 fs=  flinea * n    % flinea * width o framerate * height * width
Ts=1/fs;
t=0:Ts:(nframes/fimagen-Ts);
Vf=1/fs*fftshift(abs(fft(vf)));
f=-fs/2:fs/(size(vf,2)):fs/2-fs/(size(vf,2));
plot(t,vf);
figure;
plot(f,Vf)
axis([-2.5*flinea 2.5*flinea 0 max(Vf)])
