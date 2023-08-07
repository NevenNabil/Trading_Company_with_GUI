import MySQLdb
import MySQLdb.connections
import MySQLdb.cursors
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtWidgets import QMainWindow, QLabel
from PyQt5.QtWidgets import QGridLayout, QWidget, QDesktopWidget
import sys
import datetime
# from test import Ui_MainWindow
from PyQt5.uic import loadUiType

main, _ = loadUiType('test.ui')

employee_id = 0
employee_name = 0
language = 'EN'


class MainApp(QMainWindow, main):
    def __init__(self, parent=None):
        QMainWindow.__init__(self)
        self.setupUi(self)
        self.ui = main
        self.database()
        self.open_login_tab()
        self.ui_changes()
        self.handle_buttons()
        self.change_language()

        qtRectangle = self.frameGeometry()
        centerPoint = QDesktopWidget().availableGeometry().center()
        qtRectangle.moveCenter(centerPoint)
        self.move(qtRectangle.topLeft())
        qtRectangle = self.frameGeometry()
        centerPoint = QDesktopWidget().availableGeometry().center()
        qtRectangle.moveCenter(centerPoint)
        self.move(qtRectangle.topLeft())

    def database(self):
        self.db = MySQLdb.connect(host='localhost', user='root', password='toor', db='trading_company')
        self.cur = self.db.cursor()
        print('connection Accepted')

    def open_login_tab(self):
        self.groupBox_5.hide()
        self.lineEdit.setText('')
        self.lineEdit_2.setText('')
        self.statusBar().showMessage(' ')
        self.tabWidget.setCurrentIndex(0)

    def set_AR_language(self):
        self.statusBar().showMessage(' ')
        global language
        language = 'AR'
        self.tabWidget.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_2.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_3.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_5.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_6.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_7.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_10.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_9.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_8.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_4.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_11.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.tabWidget_12.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.change_language()

    def set_EN_language(self):
        self.statusBar().showMessage(' ')
        global language
        language = 'EN'
        self.tabWidget.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_2.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_3.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_5.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_6.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_7.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_10.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_9.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_8.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_4.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_11.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.tabWidget_12.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.change_language()

    def ui_changes(self):
        self.tabWidget.tabBar().setVisible(False)
        self.tabWidget_3.tabBar().setVisible(False)
        self.lineEdit.setFocus()
        self.label_84.hide()
        self.label_87.hide()
        self.label_88.hide()
        self.label_89.hide()
        self.label_90.hide()
        self.label_91.hide()
        self.label_92.hide()
        self.label_110.hide()
        self.label_111.hide()
        self.label_86.hide()
        self.label_275.hide()
        self.label_277.hide()
        self.label_279.hide()
        self.label_113.hide()

    def handle_buttons(self):
        self.pushButton_12.clicked.connect(self.set_AR_language)
        self.pushButton_13.clicked.connect(self.set_EN_language)
        self.pushButton.clicked.connect(self.login)
        self.pushButton_1.clicked.connect(self.open_customer_tab)
        self.pushButton_14.clicked.connect(self.open_supplier_tab)
        self.pushButton_11.clicked.connect(self.open_employee_tab)
        self.pushButton_8.clicked.connect(self.open_expenses_tab)
        self.pushButton_10.clicked.connect(self.open_product_tab)
        self.pushButton_36.clicked.connect(self.open_treasury_tab)
        self.pushButton_34.clicked.connect(self.open_setting_tab)
        self.pushButton_35.clicked.connect(self.open_report_tab)
        self.pushButton_9.clicked.connect(self.open_overview_tab)
        self.pushButton_15.clicked.connect(self.open_history_tab)
        self.pushButton_22.clicked.connect(self.open_logout_tab)
        self.pushButton_16.clicked.connect(self.open_stock_tab)
        self.pushButton_17.clicked.connect(self.open_bills_tab)
        self.pushButton_18.clicked.connect(self.open_cheque_tab)
        self.pushButton_19.clicked.connect(self.open_cash_tab)

    def open_customer_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(0)
        self.tabWidget_2.setCurrentIndex(0)

    def open_supplier_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(1)
        self.tabWidget_5.setCurrentIndex(0)

    def open_employee_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(2)
        self.tabWidget_6.setCurrentIndex(0)

    def open_expenses_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(3)

    def open_product_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(4)
        self.tabWidget_7.setCurrentIndex(0)

    def open_treasury_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(5)

    def open_setting_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(6)
        self.tabWidget_10.setCurrentIndex(0)
        self.tabWidget_9.setCurrentIndex(0)

    def open_report_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(7)

    def open_overview_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(8)

    def open_history_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(9)

    def open_stock_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(10)

    def open_bills_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(11)

    def open_cheque_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(12)

    def open_cash_tab(self):
        self.statusBar().showMessage(' ')
        self.tabWidget_3.setCurrentIndex(13)

    def open_logout_tab(self):
        self.tabWidget.setCurrentIndex(0)
        self.statusBar().showMessage(' ')
        self.groupBox_5.hide()
        self.lineEdit.setText('')
        self.lineEdit_2.setText('')

    def login(self):
        username = self.lineEdit.text()
        password = self.lineEdit_2.text()

        self.cur.execute('''SELECT emp_id, username, password FROM login ''')
        data = self.cur.fetchall()

        global employee_id, employee_name, language

        for row in data:
            if str(row[1]) == username and row[2] == password:
                self.tabWidget.setCurrentIndex(1)
                self.tabWidget_3.setCurrentIndex(0)
                self.tabWidget_2.setCurrentIndex(0)
                global employee_id
                employee_id = (row[0])
                print(employee_id)
                sql = '''SELECT name FROM employee WHERE person_id =%s'''
                self.cur.execute(sql, [employee_id])
                employee_name = self.cur.fetchone()
                print(employee_name[0])
                if language == 'EN':
                    self.statusBar().showMessage('Hello ' + employee_name[0])
                if language == 'AR':
                    self.statusBar().showMessage(employee_name[0] + ' مرحبا')
            else:
                self.groupBox_5.show()

    def change_language(self):
        global language
        if language == 'AR':
            ######### login ################
            self.label_3.setText("اسم المستخدم")
            self.label_2.setText("الرقم السرى")
            self.pushButton.setText("تسجيل دخول")
            self.pushButton_22.setText("تسجيل خروج")
            self.label_30.setText("البيانات التى قمت بادخالها غير صحيحة برجاء المحاولة مرة أخرى او التواصل مع الادارة")

            ######### left toolBox ################
            self.toolBox.setItemText(0, " بيانات أشخاص")
            self.toolBox.setItemText(1, "       مخازن")
            self.toolBox.setItemText(2, "       خزينة")
            self.toolBox.setItemText(3, "     مشتريات")

            ######### left buttons ################
            self.pushButton_1.setText("العملاء")
            self.pushButton_14.setText("الموردين")
            self.pushButton_11.setText("الموظفين")
            self.pushButton_8.setText("النفقات")
            self.pushButton_10.setText("المنتجات")
            self.pushButton_36.setText("الخزينة")
            self.pushButton_34.setText("الاعدادات")
            self.pushButton_35.setText("التقارير")
            self.pushButton_9.setText("نظرة عامة")
            self.pushButton_15.setText("التاريخ")
            self.pushButton_16.setText("المخزن")
            self.pushButton_17.setText("الفواتير")
            self.pushButton_18.setText("الشيكات")
            self.pushButton_19.setText("النقدية")
            self.pushButton_58.setText("البنك")

            ######### tabs ################
            self.tabWidget_2.setTabText(0, "عرض كل العملاء")
            self.tabWidget_2.setTabText(1, "اضافة عميل")
            self.tabWidget_2.setTabText(2, "تعديل/مسح عميل")

            self.tabWidget_5.setTabText(0, "عرض كل الموردين")
            self.tabWidget_5.setTabText(1, "اضافة مورد")
            self.tabWidget_5.setTabText(2, "تعديل/مسح مورد")

            self.tabWidget_6.setTabText(0, "عرض كل الموظفين")
            self.tabWidget_6.setTabText(1, "اضافة موظف")
            self.tabWidget_6.setTabText(2, "تعديل/مسح موظف")
            self.tabWidget_6.setTabText(3, "مستخدمين السيستم")
            self.tabWidget_6.setTabText(4, "صلاحيات المستخدم ")

            self.tabWidget_7.setTabText(0, "عرض كل المنتجات")
            self.tabWidget_7.setTabText(1, "اضافة منتج")
            self.tabWidget_7.setTabText(2, "تعديل/مسح منتج")

            self.tabWidget_10.setTabText(0, "التصنيفات")
            self.tabWidget_10.setTabText(1, "البنك")
            self.tabWidget_10.setTabText(2, "المنطقة")

            self.tabWidget_9.setTabText(0, "تصنيف العملاء")
            self.tabWidget_9.setTabText(1, "تصنيفات الموردين")
            self.tabWidget_9.setTabText(2, "تصنيفات المنتجات")
            self.tabWidget_9.setTabText(3, "تصنيفات النفقات")
            self.tabWidget_9.setTabText(4, "تصنيفات الشيكات")

            ######### labels ################
            self.label_75.hide()
            self.label_80.hide()
            self.label_79.hide()
            self.label_83.hide()
            self.label_76.hide()
            self.label_82.hide()
            self.label_74.hide()
            self.label_77.hide()
            self.label_78.hide()
            self.label_81.hide()
            self.label_107.hide()
            self.label_276.hide()
            self.label_278.hide()
            self.label_106.hide()
            self.label_84.show()
            self.label_87.show()
            self.label_88.show()
            self.label_89.show()
            self.label_90.show()
            self.label_91.show()
            self.label_92.show()
            self.label_110.show()
            self.label_111.show()
            self.label_86.show()
            self.label_275.show()
            self.label_277.show()
            self.label_279.show()
            self.label_113.show()

        if language == 'EN':
            ######### login logout ################
            self.label_3.setText("Username")
            self.label_2.setText("Password")
            self.pushButton.setText("Login")
            self.pushButton_22.setText("Logout")
            self.label_30.setText("Your data is incorrect, Please try again or contact an admin")

            ######### left toolBox ################
            self.toolBox.setItemText(0, "   Human data")
            self.toolBox.setItemText(1, "   Inventory")
            self.toolBox.setItemText(2, "   Treasury")
            self.toolBox.setItemText(3, "   Reports")

            ######### left buttons ################
            self.pushButton_1.setText("Customers")
            self.pushButton_14.setText("Suppliers")
            self.pushButton_11.setText("Employees")
            self.pushButton_8.setText("Expenses")
            self.pushButton_10.setText("Products")
            self.pushButton_36.setText("Treasury")
            self.pushButton_34.setText("Settings")
            self.pushButton_35.setText("Reports")
            self.pushButton_9.setText("Overview")
            self.pushButton_15.setText("History")
            self.pushButton_16.setText("Stock")
            self.pushButton_17.setText("Bills")
            self.pushButton_18.setText("Cheques")
            self.pushButton_19.setText("Cash")
            self.pushButton_58.setText("Bank")

            ######### tabs ################
            self.tabWidget_2.setTabText(0, "Show All Customers")
            self.tabWidget_2.setTabText(1, "Add Customer")
            self.tabWidget_2.setTabText(2, "Edit/Delete Customer")

            self.tabWidget_5.setTabText(0, "Show All Suppliers")
            self.tabWidget_5.setTabText(1, "Add Supplier")
            self.tabWidget_5.setTabText(2, "Edit/Delete Supplier")

            self.tabWidget_6.setTabText(0, "Show All Employees")
            self.tabWidget_6.setTabText(1, "Add Employee")
            self.tabWidget_6.setTabText(2, "Edit/Delete Employee")
            self.tabWidget_6.setTabText(3, "System Users")
            self.tabWidget_6.setTabText(4, "user Permissions")

            self.tabWidget_7.setTabText(0, "Show All Products")
            self.tabWidget_7.setTabText(1, "Add Product")
            self.tabWidget_7.setTabText(2, "Edit/Delete Product")

            self.tabWidget_10.setTabText(0, "Categories")
            self.tabWidget_10.setTabText(1, "Bank")
            self.tabWidget_10.setTabText(2, "Region")

            self.tabWidget_9.setTabText(0, "Customer categories")
            self.tabWidget_9.setTabText(1, "Supplier categories")
            self.tabWidget_9.setTabText(2, "Product categories")
            self.tabWidget_9.setTabText(3, "Expenses categories")
            self.tabWidget_9.setTabText(4, "Cheque categories")

            ######### labels ################
            self.label_75.show()
            self.label_80.show()
            self.label_79.show()
            self.label_83.show()
            self.label_76.show()
            self.label_82.show()
            self.label_74.show()
            self.label_77.show()
            self.label_78.show()
            self.label_81.show()
            self.label_107.show()
            self.label_276.show()
            self.label_278.show()
            self.label_106.show()
            self.label_84.hide()
            self.label_87.hide()
            self.label_88.hide()
            self.label_89.hide()
            self.label_90.hide()
            self.label_91.hide()
            self.label_92.hide()
            self.label_110.hide()
            self.label_111.hide()
            self.label_86.hide()
            self.label_275.hide()
            self.label_277.hide()
            self.label_279.hide()
            self.label_113.hide()


def main():
    app = QApplication(sys.argv)
    window = MainApp()
    window.show()
    app.exec_()
    input()


if __name__ == '__main__':
    main()
