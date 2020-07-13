library(tidyverse)
library(superml)

install.packages("superml")

nlp <- read_csv("data/data_nlp.csv")

nlp$concat <- paste(nlp$brand,nlp$description,nlp$categories,nlp$sub_category)
nlp

nlp <- nlp[setdiff(colnames(nlp), c('X1', 'brand','description', 'categories', 'sub_category'))]
nlp

set.seed(567)

# Store row numbers for training set: index_train
index_train <- sample(1:nrow(nlp), 2 / 3 * nrow(nlp))

# Create training set: training_set
training_set <- nlp[index_train, ]

# Create test set: test_set
test_set <- nlp[-index_train, ]

cfv <- CountVectorizer$new(max_features = 12, remove_stopwords = FALSE, ngram_range = c(1,3))

cfv$fit(training_set$concat)




