training_set_metadata <- read.csv("C:/Users//training_set_metadata.csv")
View(training_set_metadata)
install.packages("neuralnet")
library(neuralnet)
install.packages("deepnet")
library(deepnet)
train_data= merge(
  training_set,
  training_set_metadata,
  by=c('object_id'), 
  all.x = T
)
traindf= data.frame(
  train_data$mjd, train_data$passband, 
  train_data$flux, train_data$flux_err, 
  train_data$detected,
  train_data$target
)
train = data.matrix(traindf[1:5])
train = data.matrix(train)
label = data.matrix(traindf[6])
label = data.matrix(label)
NN <- nn.train(train,label, initW = NULL, initB = NULL, hidden=c(50,30), 
               activationfun="tanh", learningrate=0.01, momentum=0.5, 
               learningrate_scale=1, output="softmax", numepochs=3, 
               batchsize=100)
test_set <- read.csv("C:/Users//test_set.csv")
View(test_set)
test_set_metadata <- read.csv("C:/Users//test_set_metadata.csv")
test_data= merge(
  test_set,
  test_set_metadata,
  by=c('object_id'), 
  all.x = T
)
testdf= data.frame(
