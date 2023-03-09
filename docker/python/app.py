import socket
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():   
    try:    
        ## getting the hostname by socket.gethostname() method
        hostname = socket.gethostname()
        ## getting the IP address using socket.gethostbyname() method
        ip_address = socket.gethostbyname(hostname)
        body = "<!DOCTYPE html><html><head><title>EpamLabKubernetes - Python AppService.</title></head><body>"
        body += "<h1><p style='color:rgb(25,200,25);'>Python AppService</p></h1>" 
        body += "<h2><p>Aleksei Khoroshev</p></h2>"        
        body += "<div>Hello World</div>"        
        body += "<div>Hostname: " + str(hostname) + "</br>IP Address: " + str(ip_address) + "</div>"
        body += "</body></html>"        
        return body.encode()
    except Exception as e:        
        body = "<h1><p style='color:rgb(255,0,0);'>Python AppService Error</p></h1></br>"
        body += "<div>" + str(e) + "</div>"
        return body.encode()
