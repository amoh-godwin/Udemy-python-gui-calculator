import threading
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot


class Calculator(QObject):

    def __init__(self):
        QObject.__init__(self)
        # pass

    evaluated = pyqtSignal(str, arguments=["evaluate"])

    @pyqtSlot(str)
    def compute(self, stat):
        comp_thread = threading.Thread(target=self.evaluate, args=[stat])
        comp_thread.daemon = True
        comp_thread.start()

    def _solve(self, p):
        """Does the real evaluation
        """

        operators = ('-', '+', '*', '/')
        print(p, ': has come into evaluate')
        for operator in operators:
            if operator in p:
                splits = p.split(operator, 1)
                print('splits: ', splits)
                # check if string contains
                # only numbers
                left_sp = [o for o in operators if o in splits[0]]
                right_sp = [p for p in operators if p in splits[1]]
                if operator == '-':
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        left = splits[0]

                    if right_sp:
                        right = self._solve(splits[1])
                    else:
                        right = splits[1]

                    solute = float(left) - float(right)
                    return solute

                elif operator == '+':
                    print('ss: ', len(splits[0]))
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        print('ff')
                        left = splits[0]

                    if right_sp:
                        print('gere')
                        right = self._solve(splits[1])
                    else:
                        print('wee')
                        right = splits[1]

                    solute = float(left) + float(right)
                    return solute

                elif operator == '*':
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        left = splits[0]

                    if right_sp:
                        right = self._solve(splits[1])
                    else:
                        right = splits[1]

                    solute = float(left) * float(right)
                    return solute

                elif operator == '/':
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        left = splits[0]

                    if right_sp:
                        right = self._solve(splits[1])
                    else:
                        right = splits[1]

                    solute = float(left) / float(right)
                    return solute

                else:
                    pass
            else:
                pass

    def evaluate(self, s):
        """Evaluate the problem and return a solution
        """

        # Run to evalute the statement
        result = self._solve(s)

        if not result:
            result = 0.0
        # find if it can be converted to an integer
        diff = result - int(result)
        if diff == 0.0:
            final = int(result)
        else:
            final = result
        self.evaluated.emit(str(final))
