import angr
import logging

logging.getLogger('angr').setLevel('DEBUG')

p = angr.Project("./warmup",load_options={'auto_load_libs':False})
s = p.factory.blank_state(addr=0x4009D8)
flag = s.se.BVS('flag', 0x1c*8)
s.memory.store(0x6ccd60, flag)
avoids = [4197499, 4197509, 4197519, 4197529, 4197539, 4197549, 4197559, 4197569, 4197579, 4197589, 4197599, 4197606, 4197613, 4197620, 4197627, 4197634, 4197641, 4197648, 4197655, 4197662, 4197669, 4197676, 4197683, 4197690, 4197697, 4197704, 4197711, 4197718]
pg = p.factory.path_group(s)
pg.explore(find=0x400C6C, avoid = avoids[1:])
s = pg.found[0].state
print s.se.any_str(flag)
