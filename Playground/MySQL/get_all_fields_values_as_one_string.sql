SET @id = 1;
SET @fieldlist=(SELECT GROUP_CONCAT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'classes');
SET @formated_fieldlist=(concat('`', @fieldlist, '`'));
SET @formated_fieldlist=(replace(@formated_fieldlist, ",", "`,', ',`"));
SET @sql=(concat('select concat("<", ',  @formated_fieldlist, ', ">") from classes where id = ', @id, ' into @result'));

select @sql;

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select @result;