from collatzsequence import collatz

success = True

# test even
for i in range (0, 20, 2):
    if collatz(i) != (i // 2):
        print("even fail")
        success = False
        break

if success:
    print('pass')
