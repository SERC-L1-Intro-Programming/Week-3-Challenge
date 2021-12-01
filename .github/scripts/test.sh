#!/bin/bash -e

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

    result=$(echo -e "1\n" | python testeven.py)

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

    result=$(echo -e "1\n" | python testodd.py)

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
        result=$(echo -e "${test[$i]}\n" | python collatzsequence.py)
        if [[ "$result" != *"$expected" ]]; then
            echo "Sequences not generated as expected."
            echo "fail"
            exit 1
        fi
    done

    echo "Squences correctly generated."
    echo "pass"
}

"$@"