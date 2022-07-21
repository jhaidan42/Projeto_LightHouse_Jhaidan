clear all
clc;
% Lendo o dataset, a ser utilizado na escolha do modelo de classificação, 
%para uma variável do tipo table no matlab
wage_train_matlab = readtable('wage_train.csv');

% Transformando as variáveis de cada coluna para o tipo adequado 
% As colunas não transformadas abaixo já estão no tipo adequado (double)
wage_train_matlab.workclass = categorical(wage_train_matlab.workclass);
wage_train_matlab.education = categorical(wage_train_matlab.education);
wage_train_matlab.marital_status = categorical(wage_train_matlab.marital_status);
wage_train_matlab.occupation = categorical(wage_train_matlab.occupation);
wage_train_matlab.relationship = categorical(wage_train_matlab.relationship);
wage_train_matlab.race = categorical(wage_train_matlab.race);    
wage_train_matlab.sex = categorical(wage_train_matlab.sex);    
wage_train_matlab.native_country = categorical(wage_train_matlab.native_country);
wage_train_matlab.yearly_wage = categorical(wage_train_matlab.yearly_wage);

%Neste momento, a partir dos dados acima, é estabelecido um modelo de
%Classificação por meio do aplicativo "Classification Learner" da Toolbar 
%"Machine Learning and Deep Learning" do Matlab.
%O aplicativo retorna uma função, em um arquivo ".m" que é chamada e utilizada 
%na sequência do código. 
%A função permite treinar o modelo a partir de um dataset (o mesmo 
%utilizado para seleção do modelo, neste caso), e retorna 
%o modelo treinado (struct) e seu respectivo valor de accuracy.
%Com o modelo treinado, realiza-se a predição, a partir de novos dados.

%Criando e Treinando o modelo de Classificação escolhido (Optimizable Ensemble)
[wage_ensemble_trained, wage_accuracy] = wage_ensemble_trainClassifier(wage_train_matlab);

% Lendo o dataset, a ser utilizado na predição, para uma variável do tipo table no matlab
wage_test_matlab = readtable('wage_test.csv');

% Transformando as variáveis de cada coluna para o tipo adequado 
% As colunas não transformadas abaixo já estão no tipo adequado (double)
wage_test_matlab.workclass = categorical(wage_test_matlab.workclass);
wage_test_matlab.education = categorical(wage_test_matlab.education);
wage_test_matlab.marital_status = categorical(wage_test_matlab.marital_status);
wage_test_matlab.occupation = categorical(wage_test_matlab.occupation);
wage_test_matlab.relationship = categorical(wage_test_matlab.relationship);
wage_test_matlab.race = categorical(wage_test_matlab.race);    
wage_test_matlab.sex = categorical(wage_test_matlab.sex);    
wage_test_matlab.native_country = categorical(wage_test_matlab.native_country);

%Realizando predição a partir dos novos dados com o modelo treinado
yearly_wage_predicted = wage_ensemble_trained.predictFcn(wage_test_matlab);
wage_test_matlab.yearly_wage = categorical(yearly_wage_predicted);

%Salvando em arquivo ".csv" e também em ".xls"
wage_predicted.rowNumber = wage_test_matlab.Var1;
wage_predicted.predictedValues = wage_test_matlab.yearly_wage;
wage_predicted = struct2table(wage_predicted);
writetable(wage_predicted, 'predicted.csv');
writetable(wage_predicted, 'predicted.xls');
