source "${TEST_DIR}/funcs.bash"

test_start "Task List Size (should contain 1489 lines for fakeproc)"

size=$(./inspector -p "${TEST_DIR}/fakeproc" -l | wc -l)

[ "${size}" = "1489" ]
test_end
