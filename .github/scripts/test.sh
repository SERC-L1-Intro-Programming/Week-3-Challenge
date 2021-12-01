#!/bin/bash

CHALLENGEFILE=collatzsequence.py

_check_file_exists () {
    # internal function to exit test if file missing
    # arguments
    # $1 feedback message
    if [ ! -f "$CHALLENGEFILE" ]; then
        echo "$CHALLENGEFILE missing."
        exit 1
    fi
}

test_even () {
    echo "Test collatz function - even numbers"
    _check_file_exists

    # move test file
    rm -f testeven.py
    cp .github/scripts/testeven.py testeven.py

    result=$(echo -e "1\n" | python testeven.py 2>&1)

    expected_no_function="ImportError: cannot import name 'collatz' from 'collatzsequence'"
    if [[ "$result" == *"$expected_no_function"* ]]; then
        echo "Collatz function not found."
        echo "fail"
        exit 1
    fi

    if [[ "$result" == *"fail" ]]; then
        echo "Even numbers not divided as expected."
        echo "fail"
        exit 1
    fi

    echo "Even numbers correctly processed."
    echo "pass"
}

test_odd () {
    echo "Test collatz function - odd numbers"
    _check_file_exists

    # move test file
    rm -f testodd.py
    cp .github/scripts/testodd.py testodd.py

    result=$(echo -e "1\n" | python testodd.py 2>&1)

    expected_no_function="ImportError: cannot import name 'collatz' from 'collatzsequence'"
    if [[ "$result" == *"$expected_no_function"* ]]; then
        echo "Collatz function not found."
        echo "fail"
        exit 1
    fi

    if [[ "$result" == *"fail" ]]; then
        echo "Odd numbers not multiplied and increased as expected."
        echo "fail"
        exit 1
    fi

    echo "Odd numbers correctly processed."
    echo "pass"
}

test_sequence () {
    echo "Test collatz sequency stops at 1."
    _check_file_exists

    test=(1 2 3 4 5 6 20)
    expected=("" "1" "10 5 16 8 4 2 1" "2 1" "16 8 4 2 1" "3 10 5 16 8 4 2 1" "10 5 16 8 4 2 1")

    for i in "${!test[@]}"; do
        result=$(echo -e "${test[$i]}\n" | python collatzsequence.py | sed 's|.*[^0-9]||g'| xargs)
        if [[ "$result" != "${expected[$i]}" ]]; then
            echo "Sequences not generated as expected."
            echo "fail"
            exit 1
        fi
    done

    echo "Sequences correctly generated."
    echo "pass"
}

test_input_error_handling () {
    echo "Test non-integers handled."
    _check_file_exists

    test=("1.3" "puppy" "spam")
    expected="That was not an integer. Enter an integer number: "

    for i in "${!test[@]}"; do
        result=$(echo -e "${test[$i]}\n1" | python collatzsequence.py)
        echo $result
        if [[ "$result" != *"$expected" ]]; then
            echo "Input errors not handled as expected."
            echo "fail"
            exit 1
        fi
    done

    echo "Input errors handled correctly."
    echo "pass"
}

"$@"
