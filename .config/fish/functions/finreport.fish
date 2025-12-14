function finreport
    set FNAME $(date -d last\ month '+%Y%b.sql.xz')
    echo 'Saving' $FNAME
    mysqldump -C --host=rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com --user finplus_dbro --password cash_project month_report | xz -9 > $FNAME
    # mysqldump --host=rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com --user finplus_dbro --password --compress cash_project month_report report_order | xz -9 > $FNAME
    if test $pipestatus[1] = 0 -a $pipestatus[2] = 0
        echo 'Saved' $FNAME
    else
        echo 'Failed.'
    end
    # mysqldump --host=rm-d9jf50bgg7uouj65huo.mysql.ap-southeast-5.rds.aliyuncs.com --user finplus_dbro --password --compress cash_project month_report | gzip -9 > $(date -d yesterday '+%Y%b.sql.gz')
end
