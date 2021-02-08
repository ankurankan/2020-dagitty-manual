# Load the required packages.
library(dagitty)
library(lavaan)

# Load the dataset into R
data <- read.csv("adult.csv")
data <- data[complete.cases(data),]

# Define ordinal categorical variables in the dataset
data$Age <-
  ordered(data$Age, levels = c("<20", "20-34", "35-49", "50-65", ">65"))
data$Education <-
  ordered (
    data$Education,
    levels = c(
      "Non-HS-Grad",
      "HS-grad",
      "College-Associate",
      "Academic-Degree"
    )
  )
data$HoursPerWeek <-
  ordered(data$HoursPerWeek, levels = c("<20", "20-39", "40", ">40"))
data$Income <- ordered(data$Income, levels = c("<=50K", ">50K"))

# Define binary variables in the dataset
data$Race <- as.integer(data$Race)
data$Sex <- as.integer(data$Sex)
data$Immigrant <- as.integer(data$Immigrant)

# Deal with non-binary non-ordinal categorical variables
levels(data$MaritalStatus) <-
  list(Married = "Is-Married",
       NotMarried = c("Was-Married", "Never-married"))
data$MaritalStatus <- as.integer(data$MaritalStatus)

# Compute the correlation matrix for the data using lavaan
corr <- lavCor(data)

# Create the model in dagitty
model <- dagitty(
  'dag {
	bb="-4.6,-3.8,3.7,3.7"
	Age [pos="-2,-2.6"]
	Education [pos="1.4,0.5"]
	HoursPerWeek [pos="-0.6,-0.1"]
	Immigrant [pos="1.1,-2.6"]
	Income [pos="-1.6,2.7"]
	MaritalStatus [pos="-3.7,-2.6"]
	Race [pos="3.0,-2.5"]
	Sex [pos="-0.5,-2.6"]
	Age -> { Education HoursPerWeek Income MaritalStatus }
	Education -> Income
	HoursPerWeek -> Income
	Immigrant -> { Education HoursPerWeek }
	Immigrant <-> Race
	MaritalStatus -> Income
	Race -> Education
	Sex -> { Education HoursPerWeek }
}'
)

# Plot the model
plot(model)

# Test the defined model against the computed correlation matrix
localTests(model, sample.cov = corr, sample.nobs = nrow(data))

# Plot the test results
plotLocalTestResults(localTests(model, sample.cov = corr, sample.nobs = nrow(data)))
