source "${TEST_DIR}/funcs.bash"

test_start "Memory: 94.9%, 100% Usage" \
    "Checks the output and progress bar when memory usage is 94.9% and 100%."

cp "${TEST_DIR}/mem/95" "${TEST_DIR}/fakeproc/meminfo"
./inspector -p "${TEST_DIR}/fakeproc" -r | sed 's/[[:space:]]//g' \
    | grep -i 'MemoryUsage:\[##################--\]94.9%(474.5GB/500.0GB)'
result1=${?}

cp "${TEST_DIR}/mem/100" "${TEST_DIR}/fakeproc/meminfo"
# Spaces are removed before doing the string comparison:
./inspector -p "${TEST_DIR}/fakeproc" -r | sed 's/[[:space:]]//g' \
    | grep -i 'MemoryUsage:\[####################\]100.0%(500.0GB/500.0GB)'
result2=${?}


cp "${TEST_DIR}/mem/original" "${TEST_DIR}/fakeproc/meminfo"
[ ${result1} -eq 0 ] && [ ${result2} -eq 0 ]
test_end
