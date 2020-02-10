temporary_directory=$(mktemp -d)
echo $temporary_directory
cd $temporary_directory
wget https://github.com/adobe-fonts/source-sans-pro/releases/download/3.006R/source-sans-pro-3.006R.zip
unzip source-sans-pro-3.006R.zip
mkdir -p ~/.fonts/
cp source-sans-pro-3.006R/OTF/*.otf ~/.fonts/
cd ~
rm -r $temporary_directory
fc-cache -f -v