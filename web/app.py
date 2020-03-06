from flask import Flask, render_template, redirect
import pandas as pd
from sqlalchemy import create_engine

# Create an instance of Flask
app = Flask(__name__)

# Set up connection to database
# **** Note -- port number is currently 5433, but most users likely need 5432 ****
rds_connection_string = "postgres:postgres@localhost:5433/ELT_Project"
engine = create_engine(f'postgresql://{rds_connection_string}')

# Find one record of data from the mongo database
coronaDF = pd.read_sql_query('select * from patient',con=engine)
routeDF = pd.read_sql_query('select * from route',con=engine)

# Route to render index.html template using data from Mongo
@app.route("/")
def home():

    patientDF = pd.read_sql_query('select * from patient',con=engine)
    patientCount = patientDF['patient_id'].nunique()

    countries = []

    for index, item in patientDF['country'].value_counts().items():
        countryDict = {
            "country": index,
            "count": item
        }

        countries.append(countryDict)

    coronaData = {
        'patientCount': patientCount,
        'countries': countries
    }

    # Return template and data
    return render_template("index.html", data=coronaData)

@app.route("/images")
def comparison():

    coronaData = 'this is the images page'

    # Return template and data
    return render_template("comparison.html", data=coronaData)

@app.route("/data")
def dataTable():

    patientDF = pd.read_sql_query('select * from patient',con=engine)
    htmlTable = patientDF.to_html()
    coronaData = {
        'table': htmlTable
    }

    # Return template and data
    return render_template("data.html", data=coronaData)

@app.route("/map")
def makeMap():

    patientDict = {}

    for patient in routeDF['patient_id'].value_counts().index:
        
        visitList = []
        
        currentDF = routeDF[routeDF['patient_id'] == patient]
        
        for index, row in currentDF.iterrows():
            
            visitList.append({'latitude':row['latitude'],'longitude':row['longitude']})
            
        patientDict[f'patient{patient}'] = visitList

    return render_template("map.html", data=patientDict)

if __name__ == "__main__":
    app.run(debug=True)