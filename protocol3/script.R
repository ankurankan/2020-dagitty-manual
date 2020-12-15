# Load the required packages
library(dagitty)

# Define the conventionally accepted model structure using dagitty.
model <- dagitty('dag {
    bb="-0.5,-0.5,0.5,0.5"
    P38 [pos="-0.155,-0.141"]
    PIP2 [pos="-0.337,0.063"]
    PIP3 [pos="-0.278,-0.068"]
    PKA [pos="-0.127,-0.200"]
    PKC [pos="-0.111,-0.287"]
    Erk [pos="-0.061,-0.001"]
    Akt [pos="-0.115,0.052"]
    Jnk [pos="-0.208,-0.149"]
    Plcg [pos="-0.337,-0.177"]
    Mek [pos="-0.063,-0.096"]
    Raf [pos="-0.066,-0.204"]
    PIP2 -> PKC [pos="-0.485,-0.379"]
    PIP3 -> PIP2
    PIP3 -> Akt
    PIP3 -> Plcg
    PKA -> P38
    PKA -> Erk
    PKA -> Akt
    PKA -> Jnk
    PKA -> Mek
    PKA -> Raf
    PKC -> P38 [pos="-0.166,-0.227"]
    PKC -> Jnk [pos="-0.188,-0.258"]
    PKC -> Mek [pos="-0.021,-0.245"]
    PKC -> Raf
    Plcg -> PIP2
    Plcg -> PKC [pos="-0.248,-0.271"]
    Mek -> Erk
    Raf -> Mek
}')

# Load the dataset
data <- read.csv('protein_signal.csv')

# Testing the model against the dataset
tests <- localTests( x = model, data = data, type = "cis")
print(tests)

# Plot the test results
plotLocalTestResults(tests)
