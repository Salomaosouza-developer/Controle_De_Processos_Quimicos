# Controle de Processos Químicos


## O Problema

O controle de nível em sistemas de tanques acoplados é um problema clássico e fundamental na engenharia de processos químicos. O objetivo deste projeto é realizar a modelagem matemática completa de um sistema não linear de tanques interagentes em nível. O escopo abrange desde o cálculo numérico do estado estacionário e a linearização do modelo via Matriz Jacobiana, até a análise de estabilidade no domínio da frequência e o projeto de controladores clássicos (P, PI e PID). Para além disso, o projeto explora a simulação comparativa das sintonias de malhas de controle por meio de diagramas de blocos.



## Tecnologias 


Para a resolução numérica do sistema não linear, bem como derivadas parciais para a linearização do modelo e obtenção dos parâmetros do sistema e execução das funções de transferência, utilizou-se MATLAB; para a montagem, execução, exibição e comparação dos diagramas de blocos, Simulink.


## Como Executar


Para executar esse código, é necessário ter o MATLAB instalado com os principais pacotes e ferramentas, incluindo o próprio SIMULINK. Após isso, deve-se abrir o projeto inteiro no mesmo diretório, executar na seguinte ordem: "ConstantesCPQ23m" para realizar os cálculos iniciais do sistema, encontrando estado estacionário, parâmetros do sistema e suas constantes; "linearizacao" para linearizar o sistema não linear, "lugardasRaizes" para encontrar e plotar o lugar geométrico das raízes do sistema; e diagramas de blocos do sistema (arquivos com extensão .slx) para representar visualmente o fluxo de controle e avaliar o desempenho dos controladores.  
