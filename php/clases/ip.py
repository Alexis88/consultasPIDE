import socket
import json
import psutil
import uuid

data = {}
address = uuid.getnode()
mac = ':'.join(['{:02x}'.format((address >> elements) & 0xff) for elements in range(0, 8 * 6, 8)][::-1])

data['ip'] = socket.gethostbyname(socket.gethostname())
data['user'] = psutil.users()[0].name
data['mac'] = mac.upper()
data['host'] = socket.gethostname()

print(json.dumps(data))