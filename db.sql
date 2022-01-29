CREATE TABLE curators (
    id NUMBER,
    name VARCHAR2(30) NOT NULL,
    surname VARCHAR2(30) NOT NULL,
    phone VARCHAR2(30) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    salary NUMBER(9, 2) NOT NULL,
    CONSTRAINT curators_pk PRIMARY KEY (id)
);

CREATE TABLE mentors (
    id NUMBER,
    name VARCHAR2(30) NOT NULL,
    surname VARCHAR2(30) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    phone VARCHAR2(30) NOT NULL,
    payment_for_students NUMBER(9, 2) NOT NULL,
    company VARCHAR2(30),
    CONSTRAINT mentors_pk PRIMARY KEY (id)
);

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(30) NOT NULL,
    surname VARCHAR2(30) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    CONSTRAINT students_pk PRIMARY KEY (id)
);

CREATE TABLE teachers (
    id NUMBER,
    name VARCHAR2(30) NOT NULL,
    surname VARCHAR2(30) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    phone VARCHAR2(30) NOT NULL,
    hourly_payment NUMBER(9, 2) NOT NULL,
    CONSTRAINT teachers_pk PRIMARY KEY (id)
);

CREATE TABLE courses (
    id NUMBER,
    title VARCHAR2(60) NOT NULL,
    free_listening NUMBER NOT NULL,
    curators_id NUMBER NOT NULL,
    CONSTRAINT courses_pk PRIMARY KEY (id),
    CONSTRAINT curators_courses_fk FOREIGN KEY (curators_id)
        REFERENCES curators (id)
);

CREATE TABLE teachings (
    courses_id NUMBER,
    teachers_id NUMBER,
    hours NUMBER NOT NULL,
    CONSTRAINT teachings_pk PRIMARY KEY (courses_id, teachers_id),
    CONSTRAINT courses_teachings_fk FOREIGN KEY (courses_id)
        REFERENCES courses (id),
    CONSTRAINT teachers_teachings_fk FOREIGN KEY (teachers_id)
        REFERENCES teachers (id)
);

CREATE TABLE flows (
    id NUMBER,
    price NUMBER(9, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    exam_name VARCHAR2(60),
    exam_date DATE,
    exam_duration NUMBER(3),
    teachers_id NUMBER,
    courses_id NUMBER NOT NULL,
    CONSTRAINT flows_pk PRIMARY KEY (id),
    CONSTRAINT courses_flows_fk FOREIGN KEY (courses_id)
        REFERENCES courses (id),
    CONSTRAINT teachers_flows_fk FOREIGN KEY (teachers_id)
        REFERENCES teachers (id)
);

CREATE TABLE enrolls (
    flows_id NUMBER,
    students_id NUMBER,
    payment NUMBER(9, 2) NOT NULL,
    mentors_id NUMBER,
    CONSTRAINT enrolls_pk PRIMARY KEY (flows_id, students_id),
    CONSTRAINT flows_enrolls_fk FOREIGN KEY (flows_id)
        REFERENCES flows (id),
    CONSTRAINT mentors_enrolls_fk FOREIGN KEY (mentors_id)
        REFERENCES mentors (id),
    CONSTRAINT students_enrolls_fk FOREIGN KEY (students_id)
        REFERENCES students (id)
);

CREATE TABLE exams (
    flows_id NUMBER,
    students_id NUMBER,
    mark VARCHAR2(30) NOT NULL,
    CONSTRAINT exams_pk PRIMARY KEY (flows_id, students_id),
    CONSTRAINT flows_exams_fk FOREIGN KEY (flows_id)
        REFERENCES flows (id),
    CONSTRAINT students_exams_fk FOREIGN KEY (students_id)
        REFERENCES students (id)
);


INSERT INTO curators
VALUES (1, 'Милана', 'Коновалова', '+7 968 743-93-57', 'conoval@gmail.com', 100000);

INSERT INTO curators
VALUES (2, 'Данила', 'Дорохов', '+7 495 145-19-23', 'dandoroh@mail.ru', 50000);

INSERT INTO curators
VALUES (3, 'Роман', 'Никитин', '+7 478 255-13-99', 'romkka@yandex.ru', 55000);

INSERT INTO curators
VALUES (4, 'Константин', 'Орлов', '+7 612 888-14-11', 'orlov_kostya@yandex.ru', 40000);

INSERT INTO curators
VALUES (5, 'Лев', 'Румянцев', '+7 810 964-00-95', 'rumlion@gmail.com', 40000);


INSERT INTO mentors
VALUES (1, 'Кирилл', 'Комаров', 'komarov@gmail.com', '+7 964 552-25-12', 4000, 'Yandex');

INSERT INTO mentors
VALUES (2, 'Иван', 'Горбунов', 'gorbunov@gmail.com', '+7 145 943-74-93', 2500, NULL);

INSERT INTO mentors
VALUES (3, 'Максим', 'Коровин', 'korovin@mail.ru', '+7 479 147-46-82', 4500, 'Mail.ru');

INSERT INTO mentors
VALUES (4, 'Мария', 'Павловская', 'pavlovskaya@yandex.ru', '+7 745 789-53-41', 5000, 'Kaspersky');

INSERT INTO mentors
VALUES (5, 'Илья', 'Березин', 'berezin@gmail.com', '+7 563 563-54-43', 3000, NULL);

INSERT INTO mentors
VALUES (6, 'Назар', 'Филатов', 'filatov@gmail.com', '+7 756 742-41-10', 2800, NULL);

INSERT INTO mentors
VALUES (7, 'Диана', 'Булатов', 'bulatova@gmail.com', '+7 456 964-41-98', 3200, NULL);


INSERT INTO students
VALUES (1, 'Денис', 'Козловский', 'kozden@gmail.com');

INSERT INTO students
VALUES (2, 'Ярослав', 'Лавров', 'lavrov@mail.ru');

INSERT INTO students
VALUES (3, 'Варвара', 'Степанова', 'varvar@gmail.com');

INSERT INTO students
VALUES (4, 'Давид', 'Лебедев', 'lebedev@yandex.ru');

INSERT INTO students
VALUES (5, 'Дарья', 'Иванова', 'ivanova@gmail.com');

INSERT INTO students
VALUES (6, 'Ярослав', 'Кузьмин', 'yaroslav_kuz@outlook.com');

INSERT INTO students
VALUES (7, 'Артем', 'Фролов', 'florov_artem@gmail.com');

INSERT INTO students
VALUES (8, 'Артур', 'Рудаков', 'rudakart@gmail.com');

INSERT INTO students
VALUES (9, 'Ариана', 'Новикова', 'novik_ariana@gmail.com');

INSERT INTO students
VALUES (10, 'Павел', 'Степанов', 'pasha_stepanov@mail.ru');

INSERT INTO students
VALUES (11, 'Всеволод', 'Соболев', 'sobol@mail.ru');

INSERT INTO students
VALUES (12, 'Роман', 'Калмыков', 'kalmik@mail.ru');

INSERT INTO students
VALUES (13, 'Александр', 'Филиппов', 'sahsa_filippov@yandex.ru');

INSERT INTO students
VALUES (14, 'Антон', 'Петров', 'anton_petrov@gmail.com');

INSERT INTO students
VALUES (15, 'Тимур', 'Куликов', 'timur_kulikov@mail.ru');

INSERT INTO students
VALUES (16, 'Максим', 'Логинов', 'login_maks@gmail.com');

INSERT INTO students
VALUES (17, 'Егор', 'Соколов', 'egor.sokol@yandex.ru');

INSERT INTO students
VALUES (18, 'Никита', 'Золотов', 'zolotof_nikita@gmail.com');

INSERT INTO students
VALUES (19, 'Тимофей', 'Власов', 'vlasov_ti@outlook.com');

INSERT INTO students
VALUES (20, 'Даниил', 'Поляков', 'polyak@yahoo.com');

INSERT INTO students
VALUES (21, 'Игорь', 'Алешин', 'aleshin@gmail.com');

INSERT INTO students
VALUES (22, 'Кирилл', 'Алексеев', 'kirilla@gmail.com');

INSERT INTO students
VALUES (23, 'Никита', 'Попов', 'popov_nikita@gmail.com');

INSERT INTO students
VALUES (24, 'Полина', 'Агеева', 'ageeva@gmail.com');

INSERT INTO students
VALUES (25, 'Родион', 'Крылов', 'rodionka@yandex.ru');

INSERT INTO students
VALUES (26, 'Иван', 'Герасимов', 'vanya-geras@gmail.com');

INSERT INTO students
VALUES (27, 'Алиса', 'Суворова', 'little_alice@inbox.ru');

INSERT INTO students
VALUES (28, 'Ксения', 'Григорьева', 'gksu@gmail.com');

INSERT INTO students
VALUES (29, 'Сергей', 'Винокуров', 'vinokurov@gmail.com');

INSERT INTO students
VALUES (30, 'София', 'Логинова', 'sofia@gmail.com');

INSERT INTO students
VALUES (31, 'Илья', 'Котов', 'ilya_cat@gmail.com');

INSERT INTO students
VALUES (32, 'Петр', 'Белоусов', 'belousov@gmail.com');

INSERT INTO students
VALUES (33, 'Кирилл', 'Ершов', 'ershov@gmail.com');


INSERT INTO teachers
VALUES (1, 'Екатерина', 'Щукина', 'shukina@gmail.com', '+7 754 237-45-76', 400);

INSERT INTO teachers
VALUES (2, 'Матвей', 'Демин', 'demin@gmail.com', '+7 745 756-41-78', 420);

INSERT INTO teachers
VALUES (3, 'Арсений', 'Сидоров', 'sidrov@gmail.com', '+7 964 644-77-11', 350);

INSERT INTO teachers
VALUES (4, 'Иван', 'Серов', 'serov@yandex.ru', '+7 955 766-33-13', 380);

INSERT INTO teachers
VALUES (5, 'Дмитрий', 'Морозов', 'morozov@gmail.com', '+7 745 756-74-74', 450);


INSERT INTO courses
VALUES (1, 'Python-разработчик', 0, 1);

INSERT INTO courses
VALUES (2, 'Администрирование ОС Linux', 0, 1);

INSERT INTO courses
VALUES (3, 'SQL для анализа данных', 0, 2);

INSERT INTO courses
VALUES (4, 'Java-фреймворк Spring', 0, 3);

INSERT INTO courses
VALUES (5, 'Веб-разработка', 1, 4);

INSERT INTO courses
VALUES (6, 'Основы программирования на языке Python', 1, 5);


INSERT INTO teachings
VALUES (1, 1, 16);

INSERT INTO teachings
VALUES (1, 2, 8);

INSERT INTO teachings
VALUES (1, 3, 8);

INSERT INTO teachings
VALUES (2, 3, 16);

INSERT INTO teachings
VALUES (2, 2, 12);

INSERT INTO teachings
VALUES (3, 4, 30);

INSERT INTO teachings
VALUES (4, 1, 20);

INSERT INTO teachings
VALUES (4, 5, 10);

INSERT INTO teachings
VALUES (5, 5, 16);

INSERT INTO teachings
VALUES (6, 2, 16);


INSERT INTO flows
VALUES (
    1,
    20000,
    TO_DATE('15.01.2021', 'dd.mm.yyyy'),
    TO_DATE('15.06.2021', 'dd.mm.yyyy'),
    'Экзамен по прикладному использованию языка Python',
    TO_DATE('20.06.2021', 'dd.mm.yyyy'),
    90,
    1,
    1
);

INSERT INTO flows
VALUES (
    2,
    22000,
    TO_DATE('15.06.2021', 'dd.mm.yyyy'),
    TO_DATE('15.12.2021', 'dd.mm.yyyy'),
    'Экзамен по Python (Django, Flask)',
    TO_DATE('20.12.2021', 'dd.mm.yyyy'),
    120,
    2,
    1
);

INSERT INTO flows
VALUES (
    3,
    22000,
    TO_DATE('15.01.2022', 'dd.mm.yyyy'),
    TO_DATE('15.06.2022', 'dd.mm.yyyy'),
    'Экзамен по Python (Django, Flask)',
    TO_DATE('25.06.2022', 'dd.mm.yyyy'),
    120,
    2,
    1
);

INSERT INTO flows
VALUES (
    4,
    15000,
    TO_DATE('15.06.2021', 'dd.mm.yyyy'),
    TO_DATE('25.09.2021', 'dd.mm.yyyy'),
    'Практическое задание по написанию bash-скрипта',
    TO_DATE('28.09.2021', 'dd.mm.yyyy'),
    60,
    3,
    2
);

INSERT INTO flows
VALUES (
    5,
    18000,
    TO_DATE('10.02.2022', 'dd.mm.yyyy'),
    TO_DATE('10.06.2022', 'dd.mm.yyyy'),
    'Тестирование на знание SQL',
    TO_DATE('25.06.2022', 'dd.mm.yyyy'),
    90,
    4,
    3
);

INSERT INTO flows
VALUES (
    6,
    26000,
    TO_DATE('05.02.2022', 'dd.mm.yyyy'),
    TO_DATE('05.12.2022', 'dd.mm.yyyy'),
    'Защита проекта на Spring Framework',
    TO_DATE('10.12.2022', 'dd.mm.yyyy'),
    NULL,
    5,
    4
);

INSERT INTO flows
VALUES (
    7,
    26000,
    TO_DATE('05.02.2022', 'dd.mm.yyyy'),
    TO_DATE('05.12.2022', 'dd.mm.yyyy'),
    'Защита проекта на Spring Framework',
    TO_DATE('12.12.2022', 'dd.mm.yyyy'),
    NULL,
    4,
    4
);

INSERT INTO flows
VALUES (
    8,
    10000,
    TO_DATE('25.01.2022', 'dd.mm.yyyy'),
    TO_DATE('25.03.2022', 'dd.mm.yyyy'),
    NULL,
    NULL,
    NULL,
    NULL,
    5
);


INSERT INTO enrolls
VALUES (1, 1, 20000, 1);

INSERT INTO enrolls
VALUES (1, 2, 20000, 1);

INSERT INTO enrolls
VALUES (1, 3, 20000, 3);

INSERT INTO enrolls
VALUES (1, 4, 10000, NULL);

INSERT INTO enrolls
VALUES (1, 5, 20000, 2);

INSERT INTO enrolls
VALUES (1, 6, 20000, NULL);

INSERT INTO enrolls
VALUES (2, 7, 22000, 1);

INSERT INTO enrolls
VALUES (2, 8, 22000, 3);

INSERT INTO enrolls
VALUES (2, 9, 22000, 3);

INSERT INTO enrolls
VALUES (2, 10, 11000, NULL);

INSERT INTO enrolls
VALUES (2, 11, 22000, 2);

INSERT INTO enrolls
VALUES (2, 12, 22000, 5);

INSERT INTO enrolls
VALUES (3, 13, 22000, 1);

INSERT INTO enrolls
VALUES (3, 14, 11000, NULL);

INSERT INTO enrolls
VALUES (3, 15, 22000, 1);

INSERT INTO enrolls
VALUES (3, 16, 11000, NULL);

INSERT INTO enrolls
VALUES (3, 17, 22000, 2);

INSERT INTO enrolls
VALUES (4, 18, 15000, 1);

INSERT INTO enrolls
VALUES (4, 19, 7500, NULL);

INSERT INTO enrolls
VALUES (4, 20, 15000, 1);

INSERT INTO enrolls
VALUES (4, 21, 15000, 4);

INSERT INTO enrolls
VALUES (4, 22, 15000, 4);

INSERT INTO enrolls
VALUES (4, 23, 15000, 4);

INSERT INTO enrolls
VALUES (4, 24, 15000, 3);

INSERT INTO enrolls
VALUES (5, 18, 18000, 5);

INSERT INTO enrolls
VALUES (5, 19, 18000, 5);

INSERT INTO enrolls
VALUES (5, 20, 9000, NULL);

INSERT INTO enrolls
VALUES (5, 21, 9000, NULL);

INSERT INTO enrolls
VALUES (6, 22, 26000, 2);

INSERT INTO enrolls
VALUES (6, 23, 26000, 2);

INSERT INTO enrolls
VALUES (6, 24, 26000, 3);

INSERT INTO enrolls
VALUES (6, 25, 26000, 3);

INSERT INTO enrolls
VALUES (6, 26, 13000, NULL);

INSERT INTO enrolls
VALUES (6, 27, 13000, NULL);

INSERT INTO enrolls
VALUES (7, 28, 26000, 2);

INSERT INTO enrolls
VALUES (7, 1, 26000, 2);

INSERT INTO enrolls
VALUES (7, 2, 26000, 3);

INSERT INTO enrolls
VALUES (7, 3, 26000, 3);

INSERT INTO enrolls
VALUES (7, 4, 26000, 4);

INSERT INTO enrolls
VALUES (7, 5, 26000, 4);

INSERT INTO enrolls
VALUES (8, 5, 10000, 5);

INSERT INTO enrolls
VALUES (8, 6, 10000, 5);

INSERT INTO enrolls
VALUES (8, 7, 5000, NULL);

INSERT INTO enrolls
VALUES (8, 8, 5000, NULL);

INSERT INTO enrolls
VALUES (8, 9, 0, NULL);

INSERT INTO enrolls
VALUES (8, 10, 0, NULL);


INSERT INTO exams
VALUES (1, 1, 'отлично');

INSERT INTO exams
VALUES (1, 2, 'хорошо');

INSERT INTO exams
VALUES (1, 3, 'удовлетворительно');

INSERT INTO exams
VALUES (1, 4, 'удовлетворительно');

INSERT INTO exams
VALUES (1, 5, 'неудовлетворительно');

INSERT INTO exams
VALUES (1, 6, 'отлично');

INSERT INTO exams
VALUES (2, 7, 'отлично');

INSERT INTO exams
VALUES (2, 8, 'хорошо');

INSERT INTO exams
VALUES (2, 9, 'отлично');

INSERT INTO exams
VALUES (2, 10, 'хорошо');

INSERT INTO exams
VALUES (2, 11, 'удовлетворительно');

INSERT INTO exams
VALUES (2, 12, 'отлично');

INSERT INTO exams
VALUES (3, 13, 'хорошо');
INSERT INTO exams
VALUES (3, 14, 'удовлетворительно');

INSERT INTO exams
VALUES (3, 15, 'удовлетворительно');

INSERT INTO exams
VALUES (3, 16, 'отлично');

INSERT INTO exams
VALUES (3, 17, 'неудовлетворительно');

INSERT INTO exams
VALUES (4, 18, 'хорошо');

INSERT INTO exams
VALUES (4, 19, 'хорошо');

INSERT INTO exams
VALUES (4, 20, 'удовлетворительно');

INSERT INTO exams
VALUES (4, 21, 'отлично');

INSERT INTO exams
VALUES (4, 22, 'неудовлетворительно');

INSERT INTO exams
VALUES (4, 23, 'отлично');

INSERT INTO exams
VALUES (4, 24, 'удовлетворительно');

INSERT INTO exams
VALUES (5, 18, 'отлично');

INSERT INTO exams
VALUES (5, 19, 'удовлетворительно');

INSERT INTO exams
VALUES (5, 20, 'хорошо');

INSERT INTO exams
VALUES (5, 21, 'удовлетворительно');

INSERT INTO exams
VALUES (6, 22, 'удовлетворительно');

INSERT INTO exams
VALUES (6, 23, 'отлично');

INSERT INTO exams
VALUES (6, 24, 'отлично');

INSERT INTO exams
VALUES (6, 25, 'удовлетворительно');

INSERT INTO exams
VALUES (6, 26, 'хорошо');

INSERT INTO exams
VALUES (6, 27, 'неудовлетворительно');

INSERT INTO exams
VALUES (7, 28, 'удовлетворительно');

INSERT INTO exams
VALUES (7, 1, 'удовлетворительно');

INSERT INTO exams
VALUES (7, 2, 'отлично');

INSERT INTO exams
VALUES (7, 3, 'неудовлетворительно');

INSERT INTO exams
VALUES (7, 4, 'неудовлетворительно');

INSERT INTO exams
VALUES (7, 5, 'отлично');

INSERT INTO exams
VALUES (8, 6, 'удовлетворительно');

INSERT INTO exams
VALUES (8, 7, 'удовлетворительно');

INSERT INTO exams
VALUES (8, 8, 'хорошо');
