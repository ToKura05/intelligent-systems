%% Perceptrono apmokymo algoritmas

% Sugeneruojamos pradines w1, w2 ir b reiksmes
w1 = randn(1);
w2 = randn(1);
b = randn(1);

% Mokymosi zingsnis
n = 0.15;

% Pavyzdziai, ranka surasyti is duoto failo data.txt
x1 = [0.55223, 0.16975, 0.14913, 0.08838, 0.098166, 0.14115, 0.49187];
x2 = [0.83449, 0.84049, 0.77104, 0.62068,  0.79092, 0.83535, 0.80889];
d  = [1, 1, -1, -1, -1, 1, 1];

% Priskiriama pradine reiksme >0 klaidu sumai, kad ciklas pradėtų suktis
e_sum = 1;

while e_sum ~= 0

    % iteruojame per visus pavyzdzius
    for indx = 1 : length(d)
        % skaiciuojama pasvertoji suma
        v = x1(indx)*w1 + x2(indx)*w2 + b;
        % skaiciuojamas perceptrono isejimas
        if v > 0
            y = 1;
        else
            y = -1;
        end
        % skaiciuojama klaida
        e(indx) = d(indx) - y;
        % jeigu klaida yra, atnaujinami pozymiai
        if (e(indx) ~= 0)
            w1 = w1 + n*e(indx)*x1(indx);
            w2 = w2 + n*e(indx)*x2(indx);
            b  = b  + n*e(indx);
        end
    end
% po visu iteraciju skaiciuojama visu pavyzdziu klaidu absoliuciu verciu
% suma. Jai esant 0, laikome, kad perceptronas "apmokytas"
e_sum = sumabs(e);

end

% duomenys atvaizduojami dvejose asyse
x1o = [0.55223, 0.16975, 0.14115, 0.49187];
x2o = [0.83449, 0.84049, 0.83535, 0.80889];

x1k = [0.14913, 0.08838, 0.098166];
x2k = [0.77104, 0.62068,  0.79092];

scatter(x1o,x2o,"red"); 
hold on;
scatter(x1k,x2k,"^green");

% nubreziama tiesė, kuri atskiria duomenu grupes
a = linspace(0,1);
ay = -w1/w2*a-b/w2;
line(a,ay);

