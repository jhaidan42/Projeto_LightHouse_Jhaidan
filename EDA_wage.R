#Instalando pacotes necessários
install.packages('rstudioapi')
library(rstudioapi)

#Setando Diretório
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#lendo o dataset para uma variável tipo dataframe no R
wage_train_R <- read.csv("wage_train.csv")

#Obtendo um resumo sobre o dataframe inicial
summary(wage_train_R)

#Fazendo as transformações adequadas para os tipos das variáveis (categóricas)
wage_train_R$workclass <- as.factor(wage_train_R$workclass)
wage_train_R$education <- as.factor(wage_train_R$education)
wage_train_R$marital_status <- as.factor(wage_train_R$marital_status)
wage_train_R$occupation <- as.factor(wage_train_R$occupation)
wage_train_R$relationship <- as.factor(wage_train_R$relationship)
wage_train_R$race <- as.factor(wage_train_R$race)
wage_train_R$sex <- as.factor(wage_train_R$sex)
wage_train_R$native_country <- as.factor(wage_train_R$native_country)
wage_train_R$yearly_wage <- as.factor(wage_train_R$yearly_wage)

#Obtendo um resumo do dataframe após as transformações
summary(wage_train_R)

#Transformando variáveis para uma tabela, para uso nas próximas funções
yearly_wage.tb <- table(wage_train_R$yearly_wage)
workclass.tb <- table(wage_train_R$workclass)
education.tb <- table(wage_train_R$education)
marital_status.tb <- table(wage_train_R$marital_status)
occupation.tb <- table(wage_train_R$occupation)
relationship.tb <- table(wage_train_R$relationship)
race.tb <- table(wage_train_R$race)
sex.tb <- table(wage_train_R$sex)
native_country.tb <- table(wage_train_R$native_country)

#Obtendo as Frequências Relativas
prop.table(yearly_wage.tb)
prop.table(workclass.tb)
prop.table(education.tb)
prop.table(marital_status.tb)
prop.table(occupation.tb)
prop.table(relationship.tb)
prop.table(race.tb)
prop.table(sex.tb)
prop.table(native_country.tb)

#Gráfico de barras para frequência absoluta
barplot(yearly_wage.tb)
barplot(workclass.tb)
barplot(education.tb)
barplot(marital_status.tb)
barplot(occupation.tb)
barplot(relationship.tb)
barplot(race.tb)
barplot(sex.tb)
barplot(native_country.tb)

#Variáveis quantitativas discretas
#Transformando variáveis para uma tabela, para uso nas próximas funções
age.tb <- table(wage_train_R$age)
hours_per_week.tb <- table(wage_train_R$hours_per_week)

#Obtendo e plotando as frequências relativas
age.tbr <- prop.table(age.tb)
hours_per_week.tbr <- prop.table(hours_per_week.tb)
plot(age.tbr)
plot(hours_per_week.tbr)

#Obtendo medidas de posição e dispersão
age.moda <- names(age.tb)[age.tb == max(age.tb)]
age.desvpad <- sd(wage_train_R$age)
age.moda
age.desvpad
summary(wage_train_R$age)

hours_per_week.moda <- names(hours_per_week.tb)[hours_per_week.tb == max(hours_per_week.tb)]
hours_per_week.desvpad <- sd(wage_train_R$hours_per_week)
hours_per_week.moda
hours_per_week.desvpad
summary(wage_train_R$hours_per_week)