#!/bin/bash
for a in 1 2; do
	for b in a b; do
		echo $a $b
	done 
done

#!/bin/bash
if [ -d "/tmp" ]; then
	echo "/tmp is a directory"
else
	echo "/tmp is not a directory"
fi