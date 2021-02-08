Package Installation Instructions
=================================
### Dagitty ###
In the R prompt:
```R
install.packages( "dagitty" )
```
For more details please refer: https://github.com/jtextor/dagitty

### Lavaan ###
In the R prompt:
```R
install.packages( "lavaan" )
```
For more details please refer: https://lavaan.ugent.be/tutorial/install.html

### FlowCore ###
In the R prompt:
```R
if (!requireNamespace( "BiocManager", quietly = TRUE ) )
    install.packages( "BiocManager" )

BiocManager::install( "flowCore" )
```
For more details please refer: http://bioconductor.org/packages/release/bioc/html/flowCore.html

### Premessa ###
In the R prompt:
```R
install.packages( "devtools" )
library( devtools )
install_github( "ParkerICI/premessa" )
```
For more details please refer: https://github.com/ParkerICI/premessa


Usage Instructions
==================

The code and the data files for each of the protocols is in the specific folders.
To run the code from the terminal:

```bash
Rscript [script filename]
```
This will generate a file called `Rplots.pdf` with the plots and print the results in the terminal.

The code scripts can also be run from inside the R prompt using:
```R
source("[script filename]")
```
This should open a new window with the plot(s) and print the results in the R prompt.
