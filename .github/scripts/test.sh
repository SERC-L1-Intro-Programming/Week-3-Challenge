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

"$@"