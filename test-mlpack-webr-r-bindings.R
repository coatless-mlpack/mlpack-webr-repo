# Install from local repository
webr::install("mlpack", repos = "https://coatless-mlpack.github.io/mlpack-webr-repo/")

# Load library
library("mlpack")

# Set seed for reproducibility
set.seed(5551)

# Simulate data
n <- 1000  # Number of observations
beta <- c(-2, 3.2) # True coefficients
p <- length(beta)  # Determine the number of predictors (include intercept)
epsilon <- rnorm(n)  # Error term

# Simulate predictor variables
X <- cbind(1, matrix(rnorm(n * (p-1)), ncol = p - 1))

# Simulate response variable
y <- X %*% beta + epsilon

test_obs <- 1:10
X_train <- X[-test_obs, , drop = FALSE]
X_test <- X[test_obs, , drop = FALSE]
y_train <- y[-(test_obs), , drop = FALSE] # Handle class for matrix
y_test <- y[(test_obs), , drop = FALSE]

output <- mlpack::linear_regression(
    training = X_train, training_responses = y_train, verbose = TRUE)
lr_model <- output$output_model

output <- mlpack::linear_regression(input_model=lr_model, test=X_test)
y_test_responses <- output$output_predictions

df <- data.frame(X = X, y = y)
lm_model <- lm(y ~ . - 1, data = df)
y_preds_r <- predict(lm_model, data.frame(X = X_test))

cbind("Truth" = as.numeric(y_test),
      "MLPACK Pred" = as.numeric(y_test_responses),
      "R Pred" = y_preds_r)
