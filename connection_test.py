if __name__ == '__main__':
    import psycopg2
    connection = None
    cursor = None
    try:
        connection = psycopg2.connect(user="admt_g01",
                                      password="3BckDwAj",
                                      host="alcor.inf.unibz.it",
                                      port="5433",
                                      database="admt_g01")

        cursor = connection.cursor()
        # Print PostgreSQL Connection properties
        print(connection.get_dsn_parameters(), "\n")

        # Print PostgreSQL version
        cursor.execute("SELECT version();")
        record = cursor.fetchone()
        print("You are connected to - ", record, "\n")

    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        # closing database connection.
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")