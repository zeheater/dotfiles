function hexcompact
    python -c 'import sys; s=sys.stdin.buffer.read().decode().strip() if len(sys.argv) < 2 else sys.argv[1]; print(s.replace(" ",""),end="")' $argv;
end
