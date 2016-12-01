#!/usr/bin/perl





# T={(x1,y1),(x2,y2)...(xN,yN)}  xi∈X=Rn，yi∈Y={-1, +1}，i=1,2...N
# n: vitesse d'apprentissage
# yi(w*xi+b) <=0
#    w = w + n*yi*xi
#    b = b + n*yi
#




my $n = 0.1; #0.1
my $b = 0;
#longeur 57
my $dimension = 57;
my @w = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

#my @w = (0,0);
my ($FileName)=$ARGV[0]; # Tableau des paramètres
open(F,$FileName) || die "Erreur d'ouverture du fichier $FileName\n";
my $counter = 0;
my @record;
while (my $ligne = <F>){
  my @mail = split(' ',$ligne);
  my $longer = scalar @mail;
  for(my $i = 0; $i < $longer; $i++){
    $record[$counter][$i] = @mail[$i];
  }
  $counter++;
}

my $cmpt = 0;
while($cmpt <= 100){
#my $error = 10000;
#while($error >= 500){
  my $t = 0;
  my $error = 0; #if use error = 10000, have to delete 'my'
  while($t < $counter){
    my $ligne_chose = int(rand($counter));
#  print "chose line: $ligne_chose\n";
#  my $ligne_chose = $t;
  #print "chose line: $ligne_chose\n";
#  my $ligne_chose = $t;
#  print "t : $t\n";
    my $produit = 0;
    for(my $i = 0; $i < $dimension; $i++){
#    print "$w[$i] , $record[$ligne_chose][$i+1]\n";
      $produit = $produit + $w[$i]*$record[$ligne_chose][$i+1];

    }
#  print "produit scalaire: $produit\n";
        if($record[$ligne_chose][0]*$produit <=0){
#     print "y: $record[$ligne_chose][0]\n";
        $b = $b + $n*$record[$ligne_chose][0];
#     print "b: $b\n";
        for($j = 0; $j < $dimension; $j++){
          $w[$j] = $w[$j] + $n*$record[$ligne_chose][0]*$record[$ligne_chose][$j+1];
        }
#     print "w: $w[0], $w[1]\n";
      $error++;
    }
    $t++;
  }
#  print "$error\n";
  $cmpt++;
}

open(HP,">./hyperplan") || die "Erreur de creation de hyperplan\n";
for(my $i = 0; $i < $dimension; $i++){
  print HP "@w[$i] ";
}
  print HP "$b\n";

  print "coount: $cmpt\n";

close(F);
close(HP);
