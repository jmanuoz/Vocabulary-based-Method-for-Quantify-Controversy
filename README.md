# Vocabulary-based-Method-for-Quantify-Controversy
Python and R code to identify automatically controversy on Twitter through text


## Requirements 

- R version 3.6.0
- R libraries
  - igraph
  - rtweet
  - tidyverse
  - readr
  - rgexf
  
- Python 3
- Python libraries
  - networkx
  - numpy
  - scipy
  
  ## Usage
  
- File "crear_grafo.R" download data by a hashtag or key word, creates the retweet graph and save enviroment
- Bash file "calcular" recieved as parameter the name of the saved enviroment and do the following steps:
  - Create training and test files for Fasttext
  - Train the NLP model
  - Predict tags
  - Measure controversy
  
  ## Datasets
  
  Datasets used in the paper are in following link https://drive.google.com/open?id=1OiObIvZKmy6mP7o1AwgO8SxF_1pMljFP. To test them you will have to download and store them in datasets folder. New datasets collected by crear_grafo.R will store in same folder.
