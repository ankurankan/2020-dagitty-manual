library(readxl)
library(flowCore)
library(premessa)

transform_data <- function(dataset) {
  # Applies logicle transform to each column of dataset
  d <- as.matrix(dataset)
  colnames(d) <- colnames(dataset)
  d_flow <- as_flowFrame(d)
  
  lgcl <- estimateLogicle(d_flow, channels = colnames(d_flow))
  transformed <- transform(d_flow, lgcl)
  exprs(transformed)
}

load_data <- function(trans = TRUE) {
  # Loads the dataset. If `trans=TRUE` transforms each of the files
  # individually and then joins them.
  
  dataset_path <- "protein_signal_dataset/"
  filenames <- list.files(dataset_path)
  
  dataset <-
    data.frame(read_excel(paste0(dataset_path, filenames[1])))
  if (trans) {
    dataset <- transform_data(dataset)
  }
  
  for (fi in filenames[2:length(filenames)]) {
    temp_d <-
      setNames(data.frame(read_excel(paste0(
        dataset_path, fi
      ))), colnames(dataset))
    if (trans) {
      dataset <- rbind(dataset, transform_data(temp_d))
    } else {
      dataset <- rbind(dataset, temp_d)
    }
  }
  
  dataset
}

# Load the dataset without transformation and then with transformation.
d_raw <- load_data(trans = FALSE)
d_trans <- load_data(trans = TRUE)

# QQ plots for the variable: Erk without transformation and with transformation.
par(
  font.main = 1,
  cex.main = 1,
  bty = 'l',
  mfrow = c(1, 2),
  pch = 19,
  mar = c(4, 4, 2, 1)
)
qqnorm(d_raw[, 6], main = "Before logicle transformation", cex = .5)
qqnorm(d_trans[, 6], main = "After logicle transformation", cex = .5)
