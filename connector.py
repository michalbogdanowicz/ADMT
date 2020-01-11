import psycopg2


def getConnection():

    conn = psycopg2.connect(host="alcor.inf.unibz.it", database="admt_g01", user="admt_g01", password="3BckDwAj",
                            port=5433)
    return conn
