read -p "Enter the number of blocks: " nb
for (( i = 0; i < nb; i++ ))
do
  read -p "Enter block $i size: " b[$i]
  isempty[$i]=0  # Initialize the isempty array
done

read -p "Enter total number of files: " nf
for (( i = 0; i < nf; i++ ))
do
  read -p "Enter file $i size: " f[$i]
done

for (( i = 0; i < nf; i++ ))
do
  for (( j = 0; j < nb; j++ ))
  do
    if [ ${b[$j]} -ge ${f[$i]} ] && [ ${isempty[$j]} -eq 0 ]
    then
        echo "File $i (size ${f[$i]}) allocated to block $j (remaining: $(( ${b[$j]} - ${f[$i]} )))"
        isempty[$j]=1
        break
    fi
  done
done



