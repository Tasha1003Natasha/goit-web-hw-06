from datetime import datetime
import faker
import random
import sqlite3
from random import choice, randint
from datetime import datetime, timedelta

NUMBER_GROUPS = 3
NUMBER_STUDENTS = random.randint(30, 50)
NUMBER_TEACHERS = random.randint(3, 5)
NUMBER_SUBJECTS = random.randint(5, 8)
NUMBER_GREADES = random.randint(10, 20)


def generate_fake_data(number_groups, number_students, number_teachers, number_subjects, number_grades) -> tuple():
    fake_groups = []
    fake_students = []
    fake_teachers = []
    fake_subjects = []
    fake_grades = []
    '''Take from faker random data'''
    fake_data = faker.Faker('uk-Ua')

    for _ in range(number_groups):
        fake_groups.append(fake_data.word())

    for _ in range(number_students):
        fake_students.append(fake_data.name())

    for _ in range(number_teachers):
        fake_teachers.append(fake_data.name())

    for _ in range(number_subjects):
        fake_subjects.append(fake_data.word())

    for _ in range(number_grades):
        fake_grades.append(fake_data.random_int(number_grades))

    return fake_groups, fake_students, fake_teachers, fake_subjects,  fake_grades


def prepare_data(groups, students, teachers, subjects,  grades) -> tuple():

    for_groups = []
    for group in groups:
        for_groups.append((group, ))

    for_students = []
    for student in students:

        group_id = randint(1, len(groups))
        for_students.append((student, group_id))

    for_teachers = []
    for teacher in teachers:
        for_teachers.append((teacher, ))

    for_subjects = []
    for subject in subjects:
        teacher_id = randint(1, len(teachers))
        for_subjects.append((subject, teacher_id))

    for_grades = []
    for student_id in range(1, len(students) + 1):

        for grade in grades:
            subject_id = randint(1, len(subjects))
            random_days = randint(1, 365)

            grade_date_of = (
                datetime.now() - timedelta(days=random_days)
            ).date()

            for_grades.append(
                (
                    grade,
                    grade_date_of,
                    student_id,
                    subject_id,
                )
            )

    return for_groups, for_students, for_teachers, for_subjects, for_grades


def insert_data_to_db(groups, students, teachers, subjects, grades) -> None:
    with sqlite3.connect('students.db') as con:

        cur = con.cursor()

        '''Fill in the table groups'''

        sql_to_groups = """INSERT INTO groups(group_name)
                            VALUES (?)"""

        cur.executemany(sql_to_groups, groups)

        '''Fill in the table students'''

        sql_to_students = """INSERT INTO students(student_name, group_id)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_students, students)

        '''Fill in the table teachers'''

        sql_to_teachers = """INSERT INTO teachers(teacher_name)
                              VALUES (?)"""

        cur.executemany(sql_to_teachers, teachers)

        '''Fill in the table subjects'''

        sql_to_subjects = """INSERT INTO subjects(subject_name, teacher_id)
                              VALUES (?, ?)"""

        cur.executemany(sql_to_subjects, subjects)

        '''Fill in the table grades'''

        sql_to_grades = """INSERT INTO grades(grade, grade_date_of, student_id, subject_id)
                            VALUES (?, ?, ?, ?)"""

        cur.executemany(sql_to_grades, grades)

        con.commit()


if __name__ == "__main__":
    groups, students, teachers, subjects,  grades = prepare_data(
        *generate_fake_data(NUMBER_GROUPS, NUMBER_STUDENTS, NUMBER_TEACHERS, NUMBER_SUBJECTS, NUMBER_GREADES)
    )

    insert_data_to_db(groups, students, teachers, subjects,  grades)
