select * from v$database;

select owner, username from dba_users order by 1;

desc dba_users;

select * from dba_users where username like 'IRF%';

select * from database_properties;

select * from v$version;

select * from v$instance;

SELECT t.table_name,
       t.tablespace_name,
       t.num_rows,
       t.avg_row_len,
       t.blocks,
       t.empty_blocks,
       ROUND(t.blocks * ts.block_size/1024/1024,2) AS size_mb
FROM   dba_tables t
       JOIN dba_tablespaces ts ON t.tablespace_name = ts.tablespace_name
WHERE  t.owner = UPPER('&1')
ORDER BY t.table_name;

select * from dba_tables;

select * from dba_tablespaces;

SELECT a.object,
       a.type,
       a.sid,
       b.serial#,
       b.username,
       b.osuser,
       b.program
FROM   v$access a,
       v$session b
WHERE  a.sid    = b.sid
AND    a.owner  = DECODE(UPPER('&1'), 'ALL', a.object, UPPER('&1'))
AND    a.object = DECODE(UPPER('&2'), 'ALL', a.object, UPPER('&2'))
ORDER BY a.object;

select * from v$access;

select * from v$session;

select * from v$process;

select * from v$sysstat;

select * from all_dependencies;

select * from all_tab_columns;

select * from v$controlfile;

select * from dba_data_files;

select * from v$db_cache_advice;

select * from v$datafile;

select * from v$sga;

select * from v$logfile;

select * from dba_db_links;

select * from all_users;

select * from all_tables;

--select * from dba_cdb_rsrc_plan_directives;

--SELECT * FROM   dba_pdbs;

select * from all_objects; --where owner <> 'SYS';

select * from all_constraints;










