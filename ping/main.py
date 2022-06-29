import logging
import requests


logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s at %(asctime)s')

if __name__ == "__main__":
    logging.info('Sending a PING!')
    response = requests.get('http://pong-service.default.svc.cluster.local:8000')
