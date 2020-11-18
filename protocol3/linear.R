# Load the required packages
library(dagitty)

# Load the dataset
data <- read.csv( file = "ssq-data.csv", row.names = 1 )

# Define our model structure using dagitty
model <- dagitty("dag {
                       AFF -> { ALN APA CDR }
                       AIS -> { AFF EGC SUS }
                       ALN -> { APA  DET FTW PER SUS }
                       CDR -> DET
                       EGC -> HOS
                       FTW -> { DET  EGC }
                       PER -> DET
                       SAN -> { AFF AIS ALN APA CDR }
                       SUS -> { EGC FTW HOS }
                       }")

# Test the model strucutre against the data
localTests( x = model, data = data, type="cis")

# Testing implied conditional independencies with <2 conditioning variables.
localTests( x = model, data = data, max.conditioning.variables=2 )

# Plot the test results
plotLocalTestResults(localTests(model, data, type="cis"))
