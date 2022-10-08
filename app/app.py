
from unicodedata import name
from flask import render_template, Flask, url_for, request
from pathlib import Path

def is_ec2():
    return Path("/sys/devices/virtual/dmi/id/product_uuid").exists()

if is_ec2():
    from ec2_metadata import ec2_metadata
    instance_id = ec2_metadata.instance_id
    region = ec2_metadata.region
else:
    instance_id = "localhost"
    region = "localmachine"

import os


app = Flask(__name__)


@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def index(path):
    print(url_for('index'))
    return render_template("index.html", instance_id=instance_id, region=region, host=request.host)

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
