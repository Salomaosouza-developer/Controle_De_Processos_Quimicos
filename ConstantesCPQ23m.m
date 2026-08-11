% Definir os parâmetros do sistema
a2 = 10 * 16;  % cm^2
a1 = pi * (11 / 2).^2;  % cm^2
F2 = 6.32; % cm³/s
Cv1 = 3.582; % cm^5/2 * s
Cv2 = 2.869; % cm^5/2 * s




% Chute inicial para a solução
initial_guess = [1, 1];

% Resolver o sistema de equações para encontrar o estado estacionário
[sol, fval] = fsolve(@(vars) estado_estacionario(vars, F2, a2, Cv2, a1, Cv1), initial_guess);

% Exibir os resultados
disp(['Estado estacionário: h2ss = ', num2str(sol(1)), ', h1ss = ', num2str(sol(2))]);
h2ss = sol(1);
h1ss = sol(2);

B = Cv2/(2*a2*(sqrt(h2ss)));
bA2 = B*a2;
disp(['Valor de B: ', num2str(B)]);
disp(['Valor de B*a2: ', num2str(bA2)]);

Alpha = Cv2/(2*a1*(sqrt(h2ss)));
Gama = Cv1/(2*a1*(sqrt(h1ss)));
AlphaGama = Alpha/Gama;
UmSobraGama = 1/Gama;
disp(['Alpha/Gama é : ', num2str(AlphaGama), ' e 1 sobre Gama é = ',  num2str(UmSobraGama)]);


% SISTEMA DE PRIMEIRA ORDEM - OLHANDO O TANQUE 2 (O MAIS ALTO)
fprintf('\nSISTEMA DE 1ª ORDEM:\n');

num = [(1/bA2)];
den = [(1/B) 1];
sys = tf(num,den);
disp('A função de transferência do sistema é: ');
disp(sys);




fprintf('\nSISTEMA DE 2ª ORDEM DAQUI PARA BAIXO\n');

% SISTEMA DE SEGUNDA ORDEM

J = ((Alpha)/(B*a2*Gama));
Tau = 1/(B*Gama);
P =  (1/B + 1/Gama);
disp(['Valor de J: ', num2str(J), '. Valor de Tau = ', num2str(Tau), '. Valor de P = ', num2str(P)]);

wn = sqrt(1/Tau);
wn2 = (1/Tau);

K = J/(Tau*wn2);
qsi = (P/Tau)/(2*wn);

disp(['Valor de Wn: ', num2str(wn), '. Valor de wn2 = ', num2str(wn2), '. Valor de K = ', num2str(K), '. Valor de qsi = ', num2str(qsi)]);


% Definindo a função de transferência no código 
num = [wn2];
den = [1 (2*wn*qsi) wn2];
sys2 = tf(num,den);
disp(['A função de transferência do sistema é: ']);
disp(sys2);


%Raizes do sistema

poles = pole(sys2);
disp('Pólos da função de transferência:')
disp(poles)
pzmap(sys2)

angles_deg = atan2(imag(poles), real(poles)) * (180/pi);
disp('Ângulo das raízes em graus:')
disp(angles_deg)


% Calculando tempos, sobressinal, ângulos, etc do sistema
wd = wn * (sqrt(1-(qsi*qsi)));
Tr = (pi - angles_deg)/wd; % Tempo de subida
Ts1 = 5/(qsi*wn); % Tempo para 1%.
disp(['Wn do sistema = ', num2str(wd), '. Tempo para 1% do sistema = ', num2str(Ts1)]);

% Analisando a estabilidade e o Ganho Crítico do Sistema
[Gm, Pm, Wcg, Wcp] = margin(sys);
disp(['A Margem de Ganho (K_cr) é: ', num2str(Gm)]);
if isinf(Gm)
    disp('O sistema é incondicionalmente estável para qualquer ganho proporcional positivo K.');
end



% Fazendo o lugar das raizes do sistema 

rlocus(sys2);
title('Lugar das Raízes');
grid on;

% Função que define o sistema de equações no estado estacionário
function eq = estado_estacionario(vars, F2, a2, Cv2, a1, Cv1)
    h2 = vars(1);
    h1 = vars(2);
    eq = zeros(2, 1);
    
    eq(1) = (F2 / a2) - (Cv2 * sqrt(h2) / a2);
    eq(2) = (Cv2 * sqrt(h2) / a1) - (Cv1 * sqrt(h1) / a1);
end






