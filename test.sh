python3 ./e2e/beforeAll.py

for f in ./e2e/*; do
    if [ -d "$f" ]; then
      python3 "./e2e/beforeEach.py" $f
      python3 "$f/test.py" $f
      python3 "./e2e/afterEach.py" $f
    fi
done
