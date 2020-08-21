import sys
import os

sys.path.append(os.path.join(sys.path[0], 'src'))

from app import connexion_app, settings

if __name__ == '__main__':
    connexion_app.run(host=settings.host, port=settings.port)
