SET AUTOCOMMIT = 0;
use ESCOLA_AULA05;
start transaction;
select * from vitamina where cod = 3;
update vitamina set nomeVitamina = 'Ferro do feijão' where codAlimento = 3;