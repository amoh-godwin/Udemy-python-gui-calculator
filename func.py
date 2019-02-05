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

    def evaluate(self, s):
        """Evaluate the problem and return a solution
        """

        operators = ('-', '+', '*', '/')
        solute = 0.0
        for operator in operators:
            if operator in s:
                splits = s.split(operator, 1)
                if operator == '-':
                    if len(splits[0]) > 1:
                        left = self.evaluate(splits[0])
                    else:
                        left = splits[0]

                    if len(splits[1]) > 1:
                        right = self.evaluate(splits[1])
                    else:
                        right = splits[1]

                    solute = float(left) - float(right)
                    break

                elif operator == '+':
                    if len(splits[0]) > 1:
                        left = self.evaluate(splits[0])
                    else:
                        left = splits[0]

                    if len(splits[1]) > 1:
                        right = self.evaluate(splits[1])
                    else:
                        right = splits[1]

                    solute = float(left) + float(right)
                    break

                elif operator == '*':
                    if len(splits[0]) > 1:
                        left = self.evaluate(splits[0])
                    else:
                        left = splits[0]

                    if len(splits[1]) > 1:
                        right = self.evaluate(splits[1])
                    else:
                        right = splits[1]

                    solute = float(left) * float(right)
                    break

                elif operator == '/':
                    if len(splits[0]) > 1:
                        left = self.evaluate(splits[0])
                    else:
                        left = splits[0]

                    if len(splits[1]) > 1:
                        right = self.evaluate(splits[1])
                    else:
                        right = splits[1]

                    solute = float(left) / float(right)
                    break

                else:
                    pass
            else:
                pass
        # find if it can be converted to an integer
        diff = solute - int(solute)
        if diff == 0.0:
            result = int(solute)
        else:
            result = solute
        self.evaluated.emit(str(result))
