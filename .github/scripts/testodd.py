from collatzsequence import collatz

success = True

# test odd
for i in range (1, 20, 2):
    if collatz(i) != (i *3 + 1):
        print("odd fail")
        success = False
        break

if success:
    print('pass')
