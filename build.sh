#

img_url='https://mystuff.bublup.com/ui/landing_page?item_id=001-i-d16a3732-dc51-4d8c-bc4c-f7a7379be713'
curl -o krystal-water.png $img_url
perl dat2ppm.pl krystal-water.png

perl dat2ppm.pl dat2ppm.pl
#convert dat2ppm.ppm img/dat2ppm.png
gituser
git commit -a
git push
xdg-open https://michel47.github.io/carep
xdg-open https://michel47.github.io/carep/img/krystal-water.png
