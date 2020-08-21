import sys
import os

sys.path.append(os.path.join(sys.path[0], 'src'))

from sdk.config.gunicorn_conf import *

# override default sdk values here

bind = '0.0.0.0:5000'
