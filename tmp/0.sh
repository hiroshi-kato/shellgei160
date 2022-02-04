# ファイルへの保存
echo 1+1 | bc >a

# リード権限の削除
chmod -r a
# リード権限の付与
chmod +r a

# 練習1.3.a sed
# 1
echo クロロエチルエチルエーテル | sed 's/エ/メ/'
# 2
echo クロロエチルエチルエーテル | sed 's/エ/メ/2'
# 3
echo クロロメチルメチルエーテル | sed 's/メ/エ/g'
# 4
echo クロロエチルエーテル | sed 's/エチル/&&/'
# 5
echo クロロメチルエチルエーテル | sed -E 's/(メチル)(エチル)/\2\1/'
echo クロロメチルエチルエーテル | sed -E 's/(メ..)(...)/\2\1/'

# 練習1.3.c
echo 中村 山田 田代 上田 | grep -o "[^ ]田"

# 練習1.3.d awk
#1
seq 5 | awk '/[24]/'
# 2
seq 5 | awk '$1%2==0'
# 3
seq 5 | awk '$1%2==0{print $1,"偶数"}'
# 4
seq 5 | awk '$1%2==0{print $1,"偶数"}$1%2{print $1,"奇数"}'
# 5
seq 5 | awk 'BEGIN{a=0}$1%2==0{print $1,"偶数"}$1%2{print $1, "奇数"}{a+=$1}END{print "合計",a}'

# 1.3.e sorとuniq
seq 5 | awk '{print $1%2 ? "奇数": "偶数"}' | sort | uniq -c
seq 5 | awk '{print $1%2 ? "奇数": "偶数"}' | sort | uniq -c | awk '{print $2,$1}' | sort -k2,2n

# 1.3.f xargsによる一括処理
seq 4 | xargs mkdir
seq 4 | xargs rmdir
mkdir 1 3
# 入力された文字列を指定した工数ずつコマンドに渡す
# mv 1 2, mv 3 4, が実行される
seq 4 | xargs -n2 mv
seq 4 | xargs -I@ mkdir dir_@
