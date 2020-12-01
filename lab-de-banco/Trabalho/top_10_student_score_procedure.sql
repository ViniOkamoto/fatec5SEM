use SheepSchool;

delimiter //
create procedure proc_student_top10()
begin
	declare done int default false;
    declare proc_student_id, proc_course_subscription_student_id bigint;
    declare proc_student_first_name varchar(30);
    declare proc_student_last_name varchar(60);
	declare proc_student_username varchar(30);
    declare proc_student_finished_courses int;
    declare proc_student_score float;
    declare proc_course_subscription_score float;
    declare proc_course_subscription_status char(1);
    declare cur_student cursor for select id, username, first_name, last_name from student;
    declare cur_subscription cursor for select student_id, course_subscription_score, course_subscription_status from course_subscription;
    declare continue handler for not found set done = true;

	drop table if exists `student_top`;
	create temporary table `student_top` (
	  `id` bigint NOT NULL,
	  `first_name` varchar(30) DEFAULT NULL,
	  `last_name` varchar(60) DEFAULT NULL,
	  `username` varchar(30) DEFAULT NULL,
      `finished_courses` int,
      `student_score` float,
	  PRIMARY KEY (`id`),
	  UNIQUE KEY `UK_jyet50p17q01ks2bv4sn8i5r7` (`username`)
	);

	#Abrindo o cursor de student
	open cur_student;
    
    #Início do loop de Student
    student_loop: loop
    
		#Se termina o looping externo sai do looping geral...
		if done then
			leave student_loop;
		end if;
		
        #Fetch no cursor que percorre a tabela Student
		fetch cur_student into proc_student_id, proc_student_first_name, proc_student_last_name, proc_student_username;
	

		#Abrindo o cursor de course_subscription
		open cur_subscription;
        
		#Zero as variáveis que somam pontos e cursos concluídos
		set proc_student_score = 0;
        set proc_student_finished_courses = 0;
        
        #Início do loop de Course_Subscription que ocorrerá para cada Student
        subscription_loop: loop
        
			#Fetch no cursor que percorre a tabela Course_Subscription
			fetch cur_subscription into proc_course_subscription_student_id, proc_course_subscription_score, proc_course_subscription_status;
            
            #Se termina o looping interno, a variável done volta a ser false e saio do looping interno
            if done then
				set done = false;
                leave subscription_loop;
			end if;
            
            #Se o id do student em course subscription for igual ao id do cursor da tabela student, encontrei...
            if proc_course_subscription_student_id = proc_student_id then
				
                #incremento o score encontrado
                if proc_course_subscription_score is not null then
					set proc_student_score = (proc_student_score + proc_course_subscription_score);
				end if;
				
                #Se o curso estiver finalizado, incremeto 1
                if proc_course_subscription_status = 'F' then
					set proc_student_finished_courses = proc_student_finished_courses + 1;
                end if;
            end if;
        end loop subscription_loop;
            
		#Fechando o cursor de course_subscription
		close cur_subscription;
        
        #insere os dados obtidos na tabela temporária
        insert into student_top values (proc_student_id, proc_student_first_name, proc_student_last_name, proc_student_username, proc_student_finished_courses, proc_student_score);
        
	end loop student_loop;
    
	#Fechando o cursor de student
	close cur_student;
    
    select * from student_top order by student_score desc limit 10;
    
end//
delimiter ;

drop procedure proc_student_top10;

call proc_student_top10;