#!/usr/bin/perl
use strict;
use warnings;
my ($FileName)=$ARGV[0]; # Tableau des paramètres
open(F,$FileName) || die "Erreur d'ouverture du fichier $FileName\n";
open(AP,">./apprentissage") || die "Erreur de creation de apprentissage\n";
open(TS,">./test") || die "Erreur de creation de test\n";
while (my $ligne = <F>){
  my $random = rand(10);
  if($random >= 6){
    print TS "$ligne";
  }
  else{
    print AP "$ligne";
  }
}
close(F);
close(AP);
close(TS);
