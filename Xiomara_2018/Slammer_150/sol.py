import string
import sys
from subprocess import Popen, PIPE, STDOUT

cmd = "sudo perf stat -x, -e instructions:u " + "./slammer" + " 1>/dev/null"
key = ''
print cmd
while True:
    maximum = 0,0
    for i in string.printable:
        p = Popen(cmd, stdout=PIPE, stdin=PIPE, stderr=STDOUT, shell=True)
        stdout, _ = p.communicate(input='%s\n' % (key + i))
        nb_instructions = int(stdout.split(',')[0])
        if nb_instructions > maximum[0]:
            maximum = nb_instructions, i
    key += maximum[1]
    print key
    if maximum[1] == '}':
	break
