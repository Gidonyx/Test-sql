select * from s11.rbDocumentType;
select * from s11.ClientDocument;
select * from s11.Client;

#1 ЗАДАНИЕ
select 
concat (lastname," ", firstName," ", patrName) as "ФИО пациента",
case
	when sex = 1 then 'М'
    when sex = 0 then 'Ж'
end as "Пол",
birthDate as "Дата рождения"
from s11.Client
where lastname = "Иванов" and firstName="Иван";

#2 ЗАДАНИЕ
select 
lastName as "Фамилия пациента", firstName as "Имя пациента",
patrName as "Отчество пациента",birthDate as "Дата рождения пациента",
cd1.serial as "Серия документа", cd1.number as "Номер документа"
from s11.ClientDocument cd1 
INNER JOIN s11.Client ON (cd1.client_id=Client.id)
INNER JOIN s11.rbDocumentType ON (cd1.documentType_id=rbDocumentType.id)
WHERE rbDocumentType.name = "Паспорт РФ" and Client.lastName = "Иванов" and Client.firstName="Иван";

#Задание 3
update s11.Client 
SET lastName = 'Сидоров'
WHERE lastName='Иванов' and firstName = 'Иван' and patrName= 'Иванович';


