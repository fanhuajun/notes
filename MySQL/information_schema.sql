use information_schema;
select concat(round(sum(DATA_LENGTH/1024/1024), 2), 'MB')  data 

from TABLES;


use information_schema;
select * 
from TABLES
where table_schema='test' and table_name='test_t1';