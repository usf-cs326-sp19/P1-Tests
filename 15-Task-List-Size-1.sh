source "${TEST_DIR}/funcs.bash"

test_start "Task List Size (should contain 1489/1490 lines for fakeproc)"

size=$(./inspector -p "${TEST_DIR}/fakeproc" -l | wc -l)

[ "${size}" = "1489" ] || [ "${size}" = "1490" ]
test_end
