#!/bin/bash
for i in {1..50}
do
ab -n 5000 -c 100 http://localhost:80/ | grep "Time taken for tests" | awk '{print $5}' >> test.out
done