function uniqonly
if test "$argv"
  sort "$argv" | uniq -u
end
end
