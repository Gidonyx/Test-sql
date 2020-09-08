create database s11;

CREATE TABLE s11.rbDocumentType (
id int(11) NOT NULL AUTO_INCREMENT,
createDatetime datetime NOT NULL COMMENT 'Дата создания записи',
createPerson_id int(11) DEFAULT NULL COMMENT 'Автор записи (внешний id)',
modifyDatetime datetime NOT NULL COMMENT 'Дата изменения записи',
modifyPerson_id int(11) DEFAULT NULL COMMENT 'Автор изменения записи {Person}',
code varchar(8) NOT NULL COMMENT 'Код',
regionalCode varchar(16) NOT NULL COMMENT 'Региональный код',
name varchar(64) NOT NULL COMMENT 'Наименование',
group_id int(11) NOT NULL COMMENT 'Группа документов {rbDocumentTypeGroup}',
serial_format int(11) NOT NULL COMMENT 'код формата серии',
number_format int(11) NOT NULL COMMENT 'код формата номера',
federalCode varchar(16) NOT NULL COMMENT 'Федеральный код',
socCode varchar(8) NOT NULL COMMENT 'код для социальной карты',
usedIndex double NOT NULL DEFAULT 0 COMMENT 'Индекс частоты использования',
isDefault tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Тип документа по умолчанию',
isForeigner tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Признак иностранца',
netrica_Code varchar(255) DEFAULT NULL,
autoCloseDate tinyint(4) DEFAULT 0 COMMENT 'Закрывать старую запись данного типа
"вчерашней датой". 1 - закрывать, 0 - не закрывать.',
PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 230,
AVG_ROW_LENGTH = 286,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Тип документа (паспорт и пр.)';
ALTER TABLE s11.rbDocumentType
ADD INDEX code (code);
ALTER TABLE s11.rbDocumentType
ADD INDEX name (name);
ALTER TABLE s11.rbDocumentType
ADD INDEX socCode (socCode);


create table s11.Client(
id int(11) NOT NULL AUTO_INCREMENT,
createDatetime datetime NOT NULL COMMENT 'Дата создания записи',
createPerson_id int(11) DEFAULT NULL COMMENT 'Автор записи {Person}',
modifyDatetime datetime NOT NULL COMMENT 'Дата изменения записи',
modifyPerson_id int(11) DEFAULT NULL COMMENT 'Автор изменения записи {Person}',
attendingPerson_id int(11) DEFAULT NULL,
deleted tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Отметка удаления записи',
lastName varchar(30) NOT NULL COMMENT 'Фамилия',
firstName varchar(30) NOT NULL COMMENT 'Имя',
patrName varchar(30) NOT NULL COMMENT 'Отчество',
birthDate date NOT NULL COMMENT 'Дата рождения',
birthTime time NOT NULL COMMENT 'Время рождения',
sex tinyint(4) NOT NULL COMMENT 'Пол (0-неопределено, 1-М, 2-Ж)',
SNILS char(11) NOT NULL COMMENT 'СНИЛС',
bloodType_id int(11) DEFAULT NULL COMMENT 'Группа крови{rbBloodType}',
bloodDate date DEFAULT NULL COMMENT 'Дата установления группы крови',
bloodNotes tinytext NOT NULL COMMENT 'Примечания к группе крови',
growth varchar(16) NOT NULL COMMENT 'Рост при рождении',
weight varchar(16) NOT NULL COMMENT 'Вес при рождении',
embryonalPeriodWeek varchar(16) NOT NULL COMMENT 'Неделя эмбрионального
периода(в которую рожден пациент)',
birthPlace varchar(120) NOT NULL DEFAULT '' COMMENT 'Место рождения',
chronicalMKB varchar(8) NOT NULL COMMENT 'Код хронического диагноза по МКБ',
diagNames varchar(64) NOT NULL COMMENT 'Коды диагнозов',
chartBeginDate date DEFAULT NULL COMMENT 'mn,n,',
rbInfoSource_id int(11) DEFAULT NULL COMMENT 'Источник информации
{rbInfoSource}',
notes tinytext NOT NULL COMMENT 'Примечания',
IIN varchar(15) DEFAULT NULL COMMENT 'ИИН',
isConfirmSendingData tinyint(4) DEFAULT NULL COMMENT 'Флаг отвечающий за
согласие на передачу данных (i3093)',
isUnconscious tinyint(1) DEFAULT 0 COMMENT 'Флаг поступившего без сознания',
filial int(10) DEFAULT NULL COMMENT 'rbFilials.id Филиал, в котором было
установлено значение Client.filial. NULL для всех новых клиентов после обновления, -1 для
всех до обновления',
primary key (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1559176,
AVG_ROW_LENGTH = 147,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Главная запись пациента';


CREATE TABLE s11.ClientDocument (
id int(11) NOT NULL AUTO_INCREMENT,
createDatetime datetime NOT NULL COMMENT 'Дата создания записи',
createPerson_id int(11) DEFAULT NULL COMMENT 'Автор записи {Person}',
modifyDatetime datetime NOT NULL COMMENT 'Дата изменения записи',
modifyPerson_id int(11) DEFAULT NULL COMMENT 'Автор изменения записи {Person}',
deleted tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Отметка удаления записи',
client_id int(11) NOT NULL COMMENT 'Лицо, на которое выдан документ {Client}',
documentType_id int(11) NOT NULL COMMENT 'Тип документа {rbDocumentType}',
serial varchar(8) NOT NULL COMMENT 'Серия документа',
number varchar(16) NOT NULL COMMENT 'Номер документа',
date datetime NOT NULL COMMENT 'Дата начала действия документа',
origin varchar(64) NOT NULL COMMENT 'Организация выдавшая документ',
endDate datetime DEFAULT NULL COMMENT 'Дата окончания действия документа',
PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 550218,
AVG_ROW_LENGTH = 80,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Документы пациентов';
ALTER TABLE s11.ClientDocument
ADD INDEX Ser_Numb (serial, number);
ALTER TABLE s11.ClientDocument
ADD CONSTRAINT clientdocument_ibfk_7 FOREIGN KEY (client_id)
REFERENCES s11.Client (id) ON DELETE CASCADE;
ALTER TABLE s11.ClientDocument
ADD CONSTRAINT clientdocument_ibfk_8 FOREIGN KEY (documentType_id)
REFERENCES s11.rbDocumentType (id);




# Данные для табилцы rbDocumentType
insert into s11.rbDocumentType (createDatetime, modifyDatetime, code, regionalCode, name, group_id, serial_format, number_format, federalCode, socCode, usedIndex, isDefault,
isForeigner) values  ("2020-09-08 10:05:23.187","2020-09-10 10:05:23.187", 999, "178","Паспорт РФ", 1545,666,7512,"812","555","0000000",1,0);

insert into s11.rbDocumentType (createDatetime, modifyDatetime, code, regionalCode, name, group_id, serial_format, number_format, federalCode, socCode, usedIndex, isDefault,
isForeigner) values  ("2020-09-08 10:05:23.187","2020-09-10 10:05:23.187", 999, "178","Заграничный паспорт", 1545,666,7512,"812","555","0000000",1,0);

insert into s11.rbDocumentType (createDatetime, modifyDatetime, code, regionalCode, name, group_id, serial_format, number_format, federalCode, socCode, usedIndex, isDefault,
isForeigner) values  ("2020-09-08 10:05:23.187","2020-09-10 10:05:23.187", 999, "178","Паспорт Украины", 1545,666,7512,"812","555","0000000",1,0);

#Данные для таблицы Client

insert into s11.Client (createDatetime, modifyDatetime, deleted, lastname, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodNotes, growth,
weight,embryonalPeriodWeek,birthPlace,chronicalMKB,diagNames,notes) values  ("2020-09-08 10:05:23.187","2020-09-10 10:05:23.187", 0, "Иванов", "Иван","Иванович",
"2020-09-01","23:59:59",1,"08008080","она есть","54,5см.","4 кг","Больница", "Санкт-Петербург","1","123","Пациент Оказался здоров");

insert into s11.Client (createDatetime, modifyDatetime, deleted, lastname, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodNotes, growth,
weight,embryonalPeriodWeek,birthPlace,chronicalMKB,diagNames,notes) values  ("2020-10-10 15:30:23.187","2020-11-11 20:25:33.187", 0, "Прокофьева", "Валентина","Егоровна",
"2021-10-03","22:22:22",1,"0909090","Густая","45,5см.","3 кг","Больница 2", "Москва","1","123","Пациент не здоров здоров");

insert into s11.Client (createDatetime, modifyDatetime, deleted, lastname, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodNotes, growth,
weight,embryonalPeriodWeek,birthPlace,chronicalMKB,diagNames,notes) values  ("2020-10-10 15:30:23.187","2020-11-11 20:25:33.187", 0, "Наумов", "Валерий","Сергеевич",
"2021-10-03","22:22:22",1,"0909090","Густая","45,5см.","3 кг","Больница 2", "Калининград","1","123","У пациента аппендицит");

insert into s11.Client (createDatetime, modifyDatetime, deleted, lastname, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodNotes, growth,
weight,embryonalPeriodWeek,birthPlace,chronicalMKB,diagNames,notes) values  ("2020-10-10 15:30:23.187","2020-11-11 20:25:33.187", 0, "Иванов", "Иван","Анатольевич",
"2021-10-03","22:22:22",1,"0909090","Густая","45,5см.","3 кг","Больница 51", "Воронеж","1","123","У пациента аппендицит");

insert into s11.Client (createDatetime, modifyDatetime, deleted, lastname, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodNotes, growth,
weight,embryonalPeriodWeek,birthPlace,chronicalMKB,diagNames,notes) values  ("2020-10-10 15:30:23.187","2020-11-11 20:25:33.187", 0, "Иванов", "Иван","Андреевич",
"2021-10-03","22:22:22",1,"0909090","Густая","45,5см.","3 кг","Больница 51", "Воронеж","1","123","У пациента аппендицит");

insert into s11.Client (createDatetime, modifyDatetime, deleted, lastname, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodNotes, growth,
weight,embryonalPeriodWeek,birthPlace,chronicalMKB,diagNames,notes) values  ("2020-10-10 15:30:23.187","2020-11-11 20:25:33.187", 0, "Петр", "Петрович","Иванов",
"2021-10-03","22:22:22",1,"0909090","Густая","45,5см.","3 кг","Больница 51", "Воронеж","1","123","У пациента аппендицит");

#Данные для таблицы ClientDocument

insert into s11.ClientDocument (createDatetime,modifyDatetime,deleted,client_id,documentType_id,serial,number,date,origin) values ("2020-09-08 10:05:23.187",
"2020-09-10 10:05:23.187", 0, 1559176,230,7512,1275,"2020-09-08 10:05:23.187","ГУ МВД РОССИИ ПО СанктПетербургу");

insert into s11.ClientDocument (createDatetime,modifyDatetime,deleted,client_id,documentType_id,serial,number,date,origin) values ("2020-09-08 10:05:23.187",
"2020-09-10 10:05:23.187", 0, 1559177,231,7512,1275,"2020-09-08 10:05:23.187","ГУ МВД РОССИИ ПО СанктПетербургу");

insert into s11.ClientDocument (createDatetime,modifyDatetime,deleted,client_id,documentType_id,serial,number,date,origin) values ("2020-09-08 10:05:23.187",
"2020-09-10 10:05:23.187", 0, 1559178,232,7512,1275,"2020-09-08 10:05:23.187","ГУ МВД РОССИИ ПО Москве");

insert into s11.ClientDocument (createDatetime,modifyDatetime,deleted,client_id,documentType_id,serial,number,date,origin) values ("2020-09-08 10:05:23.187",
"2020-09-10 10:05:23.187", 0, 1559179,230,7512,1275,"2020-09-08 10:05:23.187","ГУ МВД РОССИИ ПО Челябинской области");

insert into s11.ClientDocument (createDatetime,modifyDatetime,deleted,client_id,documentType_id,serial,number,date,origin) values ("2020-09-08 10:05:23.187",
"2020-09-10 10:05:23.187", 0, 1559180,230,7512,1275,"2020-09-08 10:05:23.187","ГУ МВД РОССИИ ПО Челябинской области");

insert into s11.ClientDocument (createDatetime,modifyDatetime,deleted,client_id,documentType_id,serial,number,date,origin) values ("2020-09-08 10:05:23.187",
"2020-09-10 10:05:23.187", 0, 1559181,230,7512,1275,"2020-09-08 10:05:23.187","ГУ МВД РОССИИ ПО Челябинской области");

