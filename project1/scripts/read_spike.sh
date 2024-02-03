while true; do
  dd if=/dev/zero of=/tmp/bigfile bs=1M count=10000
  sleep 1
done
