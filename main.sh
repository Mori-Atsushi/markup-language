xsltproc -o generated.sh generate_sh.xsl data/books.xml
sh generated.sh
rm -f generated.sh
