# Defined in - @ line 0
function today --description alias\ today=date\ +\%Y-\%m-\%d\\\ \%H:\%M:\%S.\%N
	date +%Y-%m-%d\ %H:%M:%S.%N $argv;
end
