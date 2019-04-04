N = 1000;
parameters = [  50 - 30i, ...
                18 +  8i, ...
                12 - 10i, ...
               -14 - 60i, ...
                40 - 20i];

%%
cX = zeros(1, 6) * 1i;
cY = zeros(1, 6) * 1i;

cX(1) = real(parameters(1)) * 1i;
cX(2) = real(parameters(2)) * 1i;
cX(3) = real(parameters(3));
cX(4) = 0;
cX(5) = real(parameters(4));
cX(6) = real(parameters(5));

cY(1) = imag(parameters(4)) + imag(parameters(1)) * 1i;
cY(2) = imag(parameters(2)) * 1i;
cY(3) = imag(parameters(3)) * 1i;

t = linspace(0,2 * pi, N);

c = [1, 2, 3, 5, 6];
for i = 5
    indices = c(1:i);
    cx = cX(indices);
    cy = cY(indices);

    %
    elephantX = real(cx) * cos((indices)' * t) + imag(cx) * sin((indices)' * t);
    elephantY = real(cy) * cos((indices)' * t) + imag(cy) * sin((indices)' * t);

    %%
    figure();
    colour = [231; 84;  128] / 256;
    sizeX = elephantX - circshift(elephantX, 1, 2);
    sizeY = elephantY - circshift(elephantY, 1, 2);
    quiver(elephantY, -elephantX, sizeY, -sizeX, 'Color', colour, 'ShowArrowHead', 'off', 'linewidth', 4);
end




