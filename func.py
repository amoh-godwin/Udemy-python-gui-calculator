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

    def evaluate(self, stat):
        self.evaluated.emit(result)
