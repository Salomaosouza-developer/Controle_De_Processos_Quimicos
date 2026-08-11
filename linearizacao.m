% Definir o ponto de operação
h2_0 = 4.8525;  % Ponto de operação para h2
h1_0 = 1;  % Ponto de operação para h1

% Definir as equações não lineares
syms h2 h1
f1 = (F2 / a2) - (Cv2 * sqrt(h2) / a2);
f2 = (Cv2 * sqrt(h2) / a1) - (Cv1 * sqrt(h1) / a1);

% Calcular as derivadas parciais em torno do ponto de operação
df1_dh2 = diff(f1, h2);
df1_dh1 = diff(f1, h1);
df2_dh2 = diff(f2, h2);
df2_dh1 = diff(f2, h1);

% Avaliar as derivadas no ponto de operação
df1_dh2_at_0 = subs(df1_dh2, {h2, h1}, {h2_0, h1_0});
df1_dh1_at_0 = subs(df1_dh1, {h2, h1}, {h2_0, h1_0});
df2_dh2_at_0 = subs(df2_dh2, {h2, h1}, {h2_0, h1_0});
df2_dh1_at_0 = subs(df2_dh1, {h2, h1}, {h2_0, h1_0});

% Avaliar as funções no ponto de operação
f1_at_0 = subs(f1, {h2, h1}, {h2_0, h1_0});
f2_at_0 = subs(f2, {h2, h1}, {h2_0, h1_0});

% Formar as expressões linearizadas
linear_f1 = f1_at_0 + df1_dh2_at_0 * (h2 - h2_0) + df1_dh1_at_0 * (h1 - h1_0);
linear_f2 = f2_at_0 + df2_dh2_at_0 * (h2 - h2_0) + df2_dh1_at_0 * (h1 - h1_0);

% Exibir as expressões linearizadas
disp('Equação linearizada para dh2/dt:');
disp(linear_f1);
disp('Equação linearizada para dh1/dt:');
disp(linear_f2);