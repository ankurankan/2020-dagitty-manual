# Load the required packages
library(dagitty)

# Load the dataset
data <- read.table( "brca.txt", header = TRUE )

# Define our model structure using dagitty
model <- dagitty( 'dag {
	bb="0,0,1,1"
        age [exposure,pos="0.552,0.162"]
        irradiation [pos="0.844,0.403"]
        menopause [pos="0.277,0.410"]
        recurrence [outcome,pos="0.559,0.625"]
        age -> irradiation
        age -> menopause
        irradiation -> recurrence
        menopause -> recurrence
        age -> recurrence
}' )

# Optional: Plot the model structure
plot(model)

# Test the model structure against the dataset
tests <- localTests(model, data, type = 'cis.chisq')
tests

# Plot the test results
plotLocalTestResults(tests)
