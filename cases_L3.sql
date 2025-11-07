use second;
select name,
case department
	when 'sale' then 'sales it is'
    when 'marketing' then 'market it is'
    else 'it is not '
end from Employees;
# nested case 
select name,
case 
	when age<30 then 
		case 
			when department='sales' then 'sales it is '
            else 'not sales'
		end
	when age>30 and age <40 then 'middle'
	else 'not middle'
end as result from Employees;

select name ,
case 
	when department is not null then 'assigned'
    else 'not assigne '
end as output from Employees ;
