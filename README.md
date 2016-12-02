# Perceptron en perl
## Introduction
In machine learnining, the perceptron is an algorithm for supervised learning of binary classifiers. It is a type of linear classifier. Here we use perceptron algorithm to decide if an e-mail is a spam. spam dataset is from California University, just for learnining purpose.
## Usage
- First run `perl pre-traiter.pl spambase/spamdata.data` to format the dataset, it will generate a file `format`.
- Then run `perl repartir_aleatoire.pl format` to randomly generate two files. `apprentissage` for training, `test` for evaluating.
- Run `perl perceptron.pl apprentissage` to generate a file `hyperplan`, this is the hyperplan we calculated to the dataset, it will use to determine whether an e-mail is spam.
- Run `perl verifier.pl test hyperplan` to see in the terminal the percentage of error.
## Prerequisites
worked perfectly in Perl 5
