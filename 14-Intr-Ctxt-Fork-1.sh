source "${TEST_DIR}/funcs.bash"

test_start "Interrupts, Context Switches, and Forks"

stats=$(./inspector -p "${TEST_DIR}/fakeproc" -t \
    | grep -i -e 'interrupts' -e 'context' -e 'forks' \
    | awk -F': ' '{ print $2 }')

stats="${stats//[$'\n']/ }"

[ "${stats}" = "2896141909 3012345539 3012654" ]
test_end
