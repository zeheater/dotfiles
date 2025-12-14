function unhexlify --description 'Decode hexstring to string'
python -c "import sys;import binascii;d = sys.stdin.buffer.read() if len(sys.argv)<2 else sys.argv[1]; sys.stdout.buffer.write(binascii.unhexlify(d))" $argv
end
