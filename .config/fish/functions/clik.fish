function clik
    curl -s "http://finplus-id.oss-ap-southeast-5.aliyuncs.com/$argv[1]" | gzip --decompress
end
