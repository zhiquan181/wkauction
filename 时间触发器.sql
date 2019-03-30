SET GLOBAL event_scheduler = ON;  
SET @@global.event_scheduler = ON;  
SET GLOBAL event_scheduler = 1;  
SET @@global.event_scheduler = 1; 

DELIMITER |  
DROP PROCEDURE IF EXISTS update_remind_status |  
CREATE PROCEDURE update_remind_status()  
BEGIN  
    IF exists (select id from `goods` where `status`=1 and SYSDATE()-endtime>0) THEN  
            update `goods` o set o.status=0 where o.id in (select t.id from (select id from `goods` where `status`=1 and SYSDATE()-endtime>0) t);
    END IF;  
END   
 |  
DELIMITER; 

drop event event_remind_status;

DELIMITER //
CREATE EVENT event_remind_status  
ON SCHEDULE EVERY 1 second  do  
begin  
call update_remind_status();  
end //  
DELIMITER;

ALTER EVENT event_remind_status ON    
COMPLETION PRESERVE ENABLE;
