from flask import Flask, render_template
from models import test


app = Flask(__name__)
app.config['DEBUG'] = True

data = test()


@app.route("/")
@app.route("/home")
def home():
    return render_template("home.html", title="Vehicle List", data=data)


@app.route("/vehicle-information")
def vehicle_information():
    return render_template("vehicle-information.html", title="Vehicle Info")


@app.route("/project-information")
def project_information():
    return render_template("project-information.html", title="Project Info")


if __name__ == '__main__':
	app.run()