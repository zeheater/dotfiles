function b64decode
  printf "$argv[1]" | base64 --decode
end
