import datetime


class DateToSave:

    def __init__(self, the_date: datetime.date, key):
        self.date: datetime.date = the_date
        self.key = key
        self.day = the_date.day
        self.month = the_date.month
        self.year = the_date.year
        self.quarter = (self.month - 1) // 3 + 1
        self.semester = 1 if self.month < 6 else 2
        self.iso_week = the_date.isocalendar()[1]

    def as_tuple(self):
        """ REQUIORED FORMAT : (date_key, date, day, month, quarter, semester, year, iso_week )"""
        return self.key, self.date, self.day, self.month, self.quarter, self.semester, self.year, self.iso_week

