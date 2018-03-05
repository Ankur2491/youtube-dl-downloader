rm ./tempOut.txt
rm ./mod.file
`youtube-dl -F $1 >>./tempOut.txt`
awk '{print $1, $NF}' ./tempOut.txt >>./mod.file
sed -i '/MiB/!d' ./mod.file
greatest=0
code=0
while read -r line;
do 
x=`echo $line | cut -d ' ' -f 2 | cut -d '.' -f 1`
y=`echo $line | cut -d ' ' -f 1`
if [ $((x+0)) -gt $greatest ]
	then
	greatest=$x
	code=$y
fi  
done <./mod.file
#echo $greatest
#echo $code
nohup youtube-dl -f $code+bestaudio $1 >/dev/null 2>&1
echo "Your file is ready, Enjoy!!"
