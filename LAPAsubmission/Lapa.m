clearvars
clearvars -GLOBAL
close all
set(0,'DefaultFigureWindowStyle', 'docked')

nx = 200;                       % Number of Matrix columns
ny = 200;                       % Number of Matrix rows

V = zeros(nx,ny);               % Initial Matrix

nIterations = 1000;              % Maximum number of iterations

for k = 1:nIterations
    
    %Boundary Condtions
    V(1,:) = 0;                 % Top Boundary
    V(ny,:) = 0;                % Bottom Boundary
    
    V(:,1) = 1;                 % Left Boundary
    V(:,nx) = 1;                % Right Boundary 
    for i = 2:nx-1
%         if r == 1
%                 %V(i,j) = (V(r+1,j)+V(r,j+1)+V(r,j-1))/4;
%                 V(i,j) = 0;
%             elseif r == row
%                 %V(i,j) = (V(r-1,j)+V(r,j+1)+V(r,j-1))/4;
%                 V(i,j) = 0;
%             else
%                 V(i,j) = (V(r-1,j)+V(r+1,j)+V(r,j+1)+V(r,j-1))/4;
        for j = 2:ny-1
            V(i,j) = (V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4;
        end
        
        if mod(k,80) == 0
            surf(V')
            pause(0.05)
        end
    end
end

[Ex,Ey] = gradient(V);

figure
quiver(-Ey',-Ex',1)
