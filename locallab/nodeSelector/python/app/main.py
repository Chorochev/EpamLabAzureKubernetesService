from flask import Flask
from redis import Redis
import os
import socket

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

name = os.environ.get('NAME')

@app.route('/')
def hello():
    try:        
        body = "<!DOCTYPE html><html><head><title>EpamLabKubernetes - Python AppService.</title></head><body>"
        body += "<h1><p style='color:rgb(25,200,25);'>Python AppService</p></h1>"
        body += "<h2><p>Aleksei Khoroshev</p></h2>"
        body += "<div>Epam Lab</div>"
        body += "<div>"
        body += get_hostname_div()
        body += "</div>"
        body += "<div>"
        body += get_redis_div()
        body += "</div>"
        body += "</body></html>"
        return body
    except Exception as e:
        body = "<h1><p style='color:rgb(255,0,0);'>Python AppService Error</p></h1></br>"
        body += "<div>" + str(e) + "</div>"
        return body


def get_hostname_div():
    try:
        # getting the hostname by socket.gethostname() method
        hostname = socket.gethostname()
        # getting the IP address using socket.gethostbyname() method
        ip_address = socket.gethostbyname(hostname)
        body = "<div>"
        body += "Hostname: " + str(hostname)
        body += "</br>"
        body += "IP Address: " + str(ip_address)
        body += "</div>"
        return body
    except Exception as e:
        body = "<h1><p style='color:rgb(255,0,0);'>Hostname Error</p></h1></br>"
        body += "<div>" + str(e) + "</div>"
        return body


def get_redis_div():
    try:        
        redis.incr('hits')
        strRedis = 'Greetings from ' + name + \
            ' %s times!!!' % redis.get('hits')
        body = "<div>"
        body += str(strRedis)
        body += "</div>"
        return body
    except Exception as e:
        body = "<h3><p style='color:rgb(255,0,0);'>Redis Error</p></h3></br>"
        body += "<div>" + str(e) + "</div>"
        return body


@app.route('/connecttoredis')
def connecttoredis():
    redis.incr('hits')
    return 'Greetings from ' + name + ' %s times!!!' % redis.get('hits')


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
