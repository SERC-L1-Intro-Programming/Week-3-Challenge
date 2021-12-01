# Week 3 - Challenge

<img alt="points bar" align="right" height="36" src="../../blob/status/.github/activity-icons/points-bar.svg" />

## Challenge Exercise - The Collatz Sequence

In `collatzsequence.py` file, write a function named `collatz()` that has one parameter named `number`. The `collatz()` function should process `number` as such:

- If number is even, then collatz() should print number // 2 and return this value.
- If number is odd, then collatz() should print and return 3 * number + 1.

Then write a program that lets the user type in an integer and that keeps calling `collatz()` on that number until the function returns the value 1. (Amazingly enough, this sequence actually works for any integer—sooner or later, using this sequence, you’ll arrive at 1! Even mathematicians aren’t sure why. Your program is exploring what’s called the Collatz sequence, sometimes called "the simplest impossible math problem.")

Remember to convert the return value from `input()` to an integer with the `int()` function; otherwise, it will be a string value.

Hint: An integer number is even if `number % 2 == 0`, and it’s odd if `number % 2 == 1`.

The output of this program could look something like this:

```
Enter number:
3
10
5
16
8
4
2
1
```

### Extension - Input Validation

Add try and except statements to the previous project to detect whether the User types in a noninteger string. Normally, the `int()` function will raise a `ValueError` error if it is passed a noninteger string, as in `int('puppy')`. In the `except` clause, print a message to the user saying they must enter an integer.

```
That was not an integer. Enter an integer number: 
```

Source: https://automatetheboringstuff.com/2e/chapter3/
