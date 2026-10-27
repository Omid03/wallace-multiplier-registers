"""Check the extracted Wallace interconnect using ideal arithmetic primitives.
This is not transistor-level HSPICE verification or a timing check.
"""
from pathlib import Path
import json
import numpy as np

root = Path(__file__).resolve().parents[1]
text = (root / 'experiments/wallace8/circuit.sp').read_text()
body = text.split('.SUBCKT Wallace')[1].split('.ENDS')[0].splitlines()[1:]
a = np.repeat(np.arange(256, dtype=np.uint32), 256)
b = np.tile(np.arange(256, dtype=np.uint32), 256)
values = {'gnd': np.zeros(a.size, dtype=np.uint32), '0': np.zeros(a.size, dtype=np.uint32)}
for bit in range(8):
    values[f'a{bit}'] = (a >> bit) & 1
    values[f'b{bit}'] = (b >> bit) & 1
pending = [line.lower().split() for line in body if line.lower().startswith('x')]
while pending:
    deferred = []
    for tokens in pending:
        kind, nodes = tokens[-1], tokens[1:-1]
        count = {'and2': 2, 'ha': 2, 'fa': 3, 'cla4': 9}[kind]
        if not all(node in values for node in nodes[:count]):
            deferred.append(tokens)
            continue
        ins = [values[node] for node in nodes[:count]]
        if kind == 'and2':
            outputs = [ins[0] & ins[1]]
        elif kind in ('ha', 'fa'):
            total = sum(ins)
            outputs = [total & 1, (total >> 1) & 1]
        else:
            total = sum(ins[i] << i for i in range(4)) + sum(ins[i+4] << i for i in range(4)) + ins[8]
            outputs = [(total >> i) & 1 for i in range(5)]
        assert len(nodes[count:]) == len(outputs)
        for node, value in zip(nodes[count:], outputs):
            assert node not in values, f'Multiple drivers: {node}'
            values[node] = value
    if len(deferred) == len(pending):
        raise RuntimeError('Unresolved interconnect')
    pending = deferred
actual = sum(values[f'm{i}'] << i for i in range(16))
result = {'method': 'ideal AND/HA/FA/CLA4 evaluation of extracted Wallace connectivity',
          'input_pairs': int(a.size), 'mismatches': int(np.count_nonzero(actual != a*b)),
          'analog_simulation': False, 'transistor_subcircuits_verified': False}
print(json.dumps(result, indent=2))
if result['mismatches']:
    raise SystemExit(1)
