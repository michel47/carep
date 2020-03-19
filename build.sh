#

img_url='https://bublup-media-production.s3.amazonaws.com/uuPXtyuX0ok50yi0CPzPLA/images/full_007-im-a72beb2f-850e-404a-9129-900ce78d86af.png'
curl -o krystal-water.png $img_url
perl dat2ppm.pl krystal-water.png
rm -f krystal-water.ppm

perl dat2ppm.pl dat2ppm.pl
#convert dat2ppm.ppm img/dat2ppm.png
rm -f dat2ppm.ppm
gituser
git commit -a
git push
xdg-open https://michel47.github.io/carep
xdg-open https://michel47.github.io/carep/img/krystal-water.png
