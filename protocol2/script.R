# Load the required packages
library(dagitty)

# Define our model structure using dagitty
model <- dagitty(
  'dag {
        Age -> Irradiation
        Age -> Menopause
        Irradiation -> Recurrence
        Menopause -> Recurrence
}'
)

# Optional: Plot the model structure
plot(model)

# Load the dataset
data <- read.table("brca.txt", header = TRUE)

# Test the model structure against the dataset
tests <- localTests(model, data, type = 'cis.chisq')
tests

# Plot the test results
plotLocalTestResults(tests)
