import psycopg2
from logging import info

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-3-224-157-224.compute-1.amazonaws.com',
            database='d84knc4ekfgr5m',
            user='xrafwrrqocozrm',
            password='5b770ed1bee58494c692149554066912a9531896ad4732c93f7d5142c436f027'
        )
    # No Robot vira uma KW(Key Word) automágicamente => Remove Student   email@desejado.com
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall,created_at,updated_at)"
                 "values('{}','{}',{},{},{},NOW(),NOW());"
                 .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall']))
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    
