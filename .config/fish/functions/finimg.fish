function finimg
echo "http://finplus-id.oss-ap-southeast-5.aliyuncs.com/$argv[1]"
curl -s "http://finplus-id.oss-ap-southeast-5.aliyuncs.com/$argv[1]" | icat
end
