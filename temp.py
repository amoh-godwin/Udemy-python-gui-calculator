from time import sleep
operators = ['-', '+', '*', '/']

stat = '2+4*1*5'

def solve(s):
    no = 0
    print(s, 'has entered solve')
    for operator in operators:
        if operator in s:
            splits = s.split(operator, 1)
            print(splits)
            if operator == '-':
                if len(splits[0]) > 1:
                    left = solve(splits[0])
                else:
                    left = splits[0]

                if len(splits[1]) > 1:
                    right = solve(splits[1])
                else:
                    right = splits[1]

                solute = float(left) - float(right)
                return solute

            elif operator == '+':
                print('here for operator +')
                if len(splits[0]) > 1:
                    left = solve(splits[0])
                    print('left: ', left)
                    sleep(2)
                else:
                    left = splits[0]

                if len(splits[1]) > 1:
                    right = solve(splits[1])
                    print('right: ', right)
                    sleep(2)
                else:
                    right = splits[1]

                solute = float(left) + float(right)
                return solute

            elif operator == '*':
                if len(splits[0]) > 1:
                    left = solve(splits[0])
                    print('left: ', left)
                    sleep(2)
                else:
                    left = splits[0]

                if len(splits[1]) > 1:
                    right = solve(splits[1])
                    sleep(2)
                    print('right: ', right)
                    sleep(2)
                else:
                    right = splits[1]

                solute = float(left) * float(right)
                return solute

            elif operator == '/':
                if len(splits[0]) > 1:
                    left = solve(splits[0])
                else:
                    left = splits[0]

                if len(splits[1]) > 1:
                    right = solve(splits[1])
                else:
                    right = splits[1]

                solute = float(left) / float(right)
                return solute

            else:
                pass
        else:
            no += 1
            print('continue: ', no)


ans = solve(stat)
print(ans)
