#!/bin/bash

for i in {1..20}
  do
     ./pre-traiter.pl spambase/spambase.data
     ./repartir_aleatoire.pl format
     ./perceptron.pl apprentissage
     ./verifier.pl test hyperplan
 done

     ./calculate_average.pl result.txt
