a=variety
b=$(ps -C $a | grep -o $a )
if [ $a == $b ] 
then
	notify-send "reloaded"
else
	exec $a
fi
