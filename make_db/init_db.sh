#! /bin/bash
#
#
#               Created DB Schemas for openssl update
#               by suwonchon <suwonchon@netmarble.com>
#
#
#
#
# 
FNAME="init_adjoin_db.sql"
DB_NAME="adjoin"
TABLE_NAME="adjoin_log"
USER=""
PASS=""

echo "DROP DATABASE $DB_NAME; " > $FNAME
echo "CREATE DATABASE $DB_NAME;" >> $FNAME
echo "use $DB_NAME;" >> $FNAME
echo "CREATE TABLE $TABLE_NAME (
  id int(10) unsigned auto_increment COMMENT 'id',
  sdate datetime COMMENT 'send_date ',
  rdate datetime COMMENT 'recv_date',
  logType int(2) unsigned COMMENT 'logType',
  hostip mediumtext COMMENT 'src_ip',
  joinid mediumtext collate utf8_unicode_ci COMMENT 'joinid',
  message mediumtext collate utf8_unicode_ci COMMENT 'message',
  notice int(2) unsigned COMMENT 'notice',
  osinfo mediumtext COMMENT 'src_ip',
  hostname mediumtext COMMENT 'hostname',
  krinfo mediumtext COMMENT 'kernelinfo',
  PRIMARY KEY (id)
);" >> $FNAME
echo "flush privileges;" >> $FNAME

mysql -u$USER -p$PASS < $FNAME
rm -rf $FNAME
