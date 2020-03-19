#!/usr/bin/perl

# this script take any data and make an image with it (format .ppm)
# $Previous: QmPYNQMhMbMjQed32su9q5eNCGurGozhbiSSrh6oGf2Dva$

my $file=shift;
local *F; open F,'<',$file;
my $size = (lstat(F))[7];
local $/ = undef;
my $data = <F>;
close F;

my $pi = atan2(0,-1);
#my $ratio = 4/3; # y/x
my $iratio = $pi; # x/y

printf "size: %s\n",$size;
my $xy = $size/3 * ($iratio);
my $x = sqrt($xy);
printf "x: %.3f\n",$x;
printf "y: %.3f\n",$x / $iratio;
my $y = int($x / $iratio + 0.4999);
   $x = int( ( $size / 3 + $y - 1) / $y ); 
my $n = $x*$y*3;
my $delta = $n - $size;
my $pad = "\x00" x $delta;
printf "playload: %sx%s = %s\n",$x,$y,$n;
printf "delta: %s\n", $delta;

my $hdr = <<"EOS";
P6
$x $y
255
EOS

my $fname = $file; $fname =~ s,.*/,,;
my $bname = $fname; $bname =~ s/\.[^\.]*$//;
printf "fname: %s\n",$fname;
local *PPM; open PPM,'>',"$bname.ppm";
print PPM $hdr;
binmode(PPM);
print PPM $data;
print PPM $pad;
close PPM;
if (-d 'img') {
  system("convert $bname.ppm img/$bname.png");
}

exit $?;


1; # $Source: /my/perl/scripts/dat2ppm.pl$
