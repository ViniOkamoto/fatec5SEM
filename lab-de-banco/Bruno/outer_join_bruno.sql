use ESCOLA_AULA05;

select * from Disciplina;

insert into PreReq (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc) values
	('INFOR', 30, 'INFOR', 32),
	('INFOR', 31, 'INFOR', 33),
    ('TI001', 1, 'TI001', 2),
    ('TI002', 3, 'TI002', 4),
    ('TI003', 7, 'TI003', 6);

SELECT * FROM PreReq;

select disciplina.nomedisc, discpre.nomedisc
	from (Disciplina natural left join PreReq) left join disciplina as discpre
         ON (prereq.coddeptoprereq=discpre.coddepto and
             prereq.numdiscprereq=discpre.numdisc);