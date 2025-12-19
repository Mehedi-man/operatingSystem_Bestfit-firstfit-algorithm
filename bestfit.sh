read -p "Enter the number of blocks: " nb
for (( i = 0; i < nb; i++ ))
do
  read -p "Enter block $i size: " b[$i]
  isempty[$i]=0
done

read -p "Enter total number of files: " nf
for (( i = 0; i < nf; i++ ))
do
  read -p "Enter file $i size: " f[$i]
done

echo -e "FN\tFS\tBN\tBS\tF"

for (( i = 0; i < nf; i++ ))
do
  best=-1
  min_frag=999999

  for (( j = 0; j < nb; j++ ))
  do
    if [ ${isempty[$j]} -eq 0 ] && [ ${b[$j]} -ge ${f[$i]} ]
    then
      frag=$(( b[$j] - f[$i] ))
      if [ $frag -lt $min_frag ]
      then
        min_frag=$frag
        best=$j
      fi
    fi
  done

  if [ $best -ne -1 ]
  then
    echo -e "$i\t${f[$i]}\t$best\t${b[$best]}\t$min_frag"
    isempty[$best]=1
  else
    echo -e "$i\t${f[$i]}\tNot Allocated"
  fi
done

