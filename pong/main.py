import logging

from flask          import Flask
from flask_restful  import Api, Resource


logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s at %(asctime)s')

app     = Flask("PINGPONG")
api     = Api(app)

class HealthStatusAPI(Resource):

    def  __init__(self):
        super().__init__()

    def get(self):
        logging.info('Received a PING!')
        return { "msg": "PONG" }, 200

api.add_resource(
    HealthStatusAPI,
    '/'
)

if __name__ == '__main__':
    app.run()
