import psycopg2
import datetime
import sys
from date_stuff import DateToSave


def main():
    connection = None
    cursor = None
    try:
        d = datetime.date(2018, 1, 1)

        connection = psycopg2.connect(user="admt_g01",
                                      password="3BckDwAj",
                                      host="alcor.inf.unibz.it",
                                      port="5433",
                                      database="admt_g01")

        cursor = connection.cursor()
        sql = """INSERT INTO public."date"(date_key, date,day, month, quarter, semester, year, iso_week )
                   VALUES(%s, %s, %s, %s, %s, %s, %s, %s);"""
        for i in range(12054):

            data: DateToSave = DateToSave(d, (i + 1))
            cursor.execute(sql, data.as_tuple())
            print('\r inserted' + str(i))
            sys.stdout.flush()
            d = d + datetime.timedelta(days=1)
        connection.commit()
    except (Exception, psycopg2.Error) as error:
        print("Error! ", error)
    finally:
        # closing database connection.
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")


if __name__ == '__main__':
    main()
