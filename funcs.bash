
test_file_name="$(basename "${0}")"
test_num="${test_file_name%%-*}"
test_pts="${test_file_name##*-}"
test_pts="${test_pts/.sh/}"
test_name="${test_file_name%-*}"
test_name="${test_name##*-}"
in_test=false

exec &> "${TEST_DIR}/test.${test_num}.md"
#exec &> "./grade-info.md"
#
#deductions=""
#
#return=0
#test_count=0
#
#echo "# Grade Information"
#echo

test_start() {
    if [[ ${in_test} == true ]]; then
        echo "FATAL: Entering test block failed: missing 'test_end'?"
        exit 1
    fi
    in_test=true
    ((test_count++))
    echo "## Test ${test_num}: ${1} [${test_pts} pts]"
    if [[ -n ${2} ]]; then
        echo
        echo "${2}"
    fi
    echo
    echo '```'
    trace_on
}

test_end() {
    return=${?}
    { trace_off; } 2> /dev/null
    in_test=false
    echo -e '```'"\n"
    exit "${return}"
}

trace_on() {
    set -x -v
}

trace_off() {
    { set +x +v; } 2> /dev/null
}

