function finsql --wraps='mysql -h rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com -u finplus_dbro -p' --wraps='mysql -s -h rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com -u finplus_dbro -p' --wraps='mysql -B -h rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com -u finplus_dbro -p' --description 'alias finsql mysql -h rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com -u finplus_dbro -p'
  printf 'P@ssw0rd1oKarakter' | clip
  mysql -h rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com -u finplus_dbro --ssl=false -p $argv
        
end
