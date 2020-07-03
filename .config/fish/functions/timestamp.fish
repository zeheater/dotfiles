# Defined in - @ line 0
function timestamp --description 'alias timestamp=date +%s%N'
	date +%s%N $argv;
end
