use SheepSchool;

delimiter //
create procedure proc_reg_count()
begin
set @OutputPath :=  CONCAT('/usr/local/mysql-8.0.22-macos10.15-x86_64/tmp/procedure_log_', current_timestamp(), '.txt');

set @q1 :=	CONCAT("select 'TableName', 'RegistersCount'
					union all
						select '---------', '--------------'
					union all
						select 'Area' as 'Table name', count(*) as 'Registers count' from Area
					union all
						select 'Course_Area' as 'Table name', count(*) as 'Registers count' from Course_Area
					union all
						select 'Course_Instructor' as 'Table name', count(*) as 'Registers count' from Course_Instructor
					union all
						select 'Course_Requirement' as 'Table name', count(*) as 'Registers count' from Course_Requirement
					union all
						select 'Course_Subscription' as 'Table name', count(*) as 'Registers count' from Course_Subscription
					union all
						select 'Course_Willlearn' as 'Table name', count(*) as 'Registers count' from Course_Willlearn
					union all
						select 'Course_Wontlearn' as 'Table name', count(*) as 'Registers count' from Course_Wontlearn
					union all
						select 'Hibernate_Sequences' as 'Table name', count(*) as 'Registers count' from Hibernate_Sequences
					union all
						select 'Instructor' as 'Table name', count(*) as 'Registers count' from Instructor
					union all
						select 'Lesson' as 'Table name', count(*) as 'Registers count' from Lesson
					union all
						select 'Lesson_Instructor' as 'Table name', count(*) as 'Registers count' from Lesson_Instructor
					union all
						select 'Roles' as 'Table name', count(*) as 'Registers count' from Roles
					union all
						select 'Student' as 'Table name', count(*) as 'Registers count' from Student
					into outfile '", @OutputPath, "'FIELDS TERMINATED BY ' - '
						LINES TERMINATED BY '\n';");
        
prepare s1 from @q1;
execute s1;
deallocate prepare s1;
end//
delimiter ;

drop procedure if exists proc_reg_count;

call proc_reg_count;