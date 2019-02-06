one = '13+-0*%^/'
tup = ('+', '-')
kk = [a for a in tup if a in one]
if kk:
    ans = 'yes'
else:
    ans = 'no'
#if tup in one:
#    ans = 'yes'
#else:
#    ans = 'no'

print(kk)
print(ans)
