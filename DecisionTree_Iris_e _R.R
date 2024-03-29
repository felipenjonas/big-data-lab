#�rvore de deci��o com dataset Iris
str(iris)
View(iris)

# Criando 70% base de dados para treino e 30% para teste aleatoriamente 
nrow(iris)
sample(1:150,105)

# Usar set.seed para for�ar os mesmos dados aleatorios em todas as
# ocasio�es de uso do sample
set.seed(123)
# Filtro conter� os dados aleat�rios
filtro <- sample(1:nrow(iris), nrow(iris)*0.7)
# treino vai usar os dados de filtro]
treino <- iris[filtro,]
# teste conter� o inverso de filtro
teste <- iris[-filtro,] 

# importando o pacote "rpart" que possui algoritmos de �rvores de decis�o.
install.packages("rpart")
library(rpart)
# Criando o modelo de �rvore de decis�o. Usar m�todo rpart e nos par�metros especificar o atributo Species para ser classificado em fun��o de todas as outras vari�veis
modelo <- rpart(Species ~., data = treino)
# Visualizar o modelo com rpart.plot
install.packages("rpart.plot")
library ("rpart.plot")

prp (modelo, extra=1)

# Avaliando a previsao do teste
prev = predict(modelo, teste, type = "class")
View(prev)

# Teste de acur�cia do modelo:
install.packages("caret")
library(caret)

confusionMatrix (prev,teste$Species)


