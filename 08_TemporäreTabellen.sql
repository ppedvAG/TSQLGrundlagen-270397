--Temporäre Tabellen


/*
#T  lokale temporäre Tabelle
existieren nur in der Erstellersession
Lebt bis ein DROP TABLE kommt oder die Session wird geschlossen


##T  globale temporäre Tabelle
existiert auch in anderen Sessions
Lebt bis DROP TABLE oder SESSION geschlossen
laufende Abfragen werden allerdings nicht unterbrichen, wenn die ##t gelöscht wird



*/

select * into #t from customers

select * from #t

select * into ##t from customers
select * from ##t


--Variante mit Sichten