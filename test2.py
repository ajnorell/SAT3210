cursor.execute("SELECT location loc_id FROM theater",)
        if cursor.rowcount == 0:
            print("There are no locations :(")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["Location","Location ID"])
            for i in rows:
                table.add_row(i)
            print(table)