function httpcat
curl -s "https://http.cat/$argv[1]" | icat
end
