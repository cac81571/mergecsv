#!/bin/bash

if [ -f merge.txt ]; then
	rm merge.txt
fi

count=0
for file in test*.csv ; do
	echo $count:$file
	if [ $count -eq 0 ]; then
		# １つ目のファイルだけ
		# ヘッダ（先頭行）を出力
		# １列目に「プロジェクト名」を出力
		awk '{$0="プロジェクト名,"$0; print}' $file | head -n 1 >> merge.txt
	fi
	# ２行目以降を出力
	# １列目に「ファイル名」を出力
	awk '{$0=FILENAME","$0; print}' $file | sed '1d'  >> merge.txt
	((count++))
done


