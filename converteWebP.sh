#!/bin/bash

echo "Realizando conversão de arquivos JPEG"
for ARQUIVO in `find $1 -iname *.jpg` ; do

	WEBP="`echo $ARQUIVO |cut -d "." -f1`"
	cwebp $ARQUIVO -o $WEBP.webp

	rm -f $ARQUIVO

done

echo "Realizando conversão de arquivos PNG"
for ARQUIVO in `find $1 -iname *.png` ; do

        WEBP="`echo $ARQUIVO |cut -d "." -f1`"
        cwebp $ARQUIVO -o $WEBP.webp

        rm -f $ARQUIVO

done

echo "Renomeando arquivos nas referencias"

for TIPO in `grep -ilR .png $1` ; do

sed -i 's/.png/.webp/g' $TIPO

done

for TIPO in `grep -ilR .jpg $1` ; do

sed -i 's/.jpg/.webp/g' $TIPO

done
