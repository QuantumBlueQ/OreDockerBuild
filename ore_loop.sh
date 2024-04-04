while true
do
  echo "Running"
  ./ore --rpc "your rpc" --keypair "keypair.json" --priority-fee 1000 mine --threads 1
  echo "Exited"
done

