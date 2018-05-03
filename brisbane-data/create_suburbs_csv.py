import csv
import pandas
'''
This scrpit uses the adjacent suburbs csv to create a list of unquie suburbs in
Brisbane. This will be saved as a seperate csv which will be used to creae the main
reference table of suburds in the database.
'''


# Create a list containing the column names from the csv file.
colnames = ['SUBURB', 'Adjoining_SUBURB']
# read csv file using pandas module.
data = pandas.read_csv('original_data_files/adjacentsuburbs20171108.csv', names=colnames)

# create list from cotaining everything is the 'SUBURB' column, including header.
suburb = data.SUBURB.tolist()

print(suburb[0:6])

# slice list to remove the header row.
suburb = suburb[1:]

print(suburb[0:6])

# the following line demonstrates creating a set. The following code also does this and 
# creates a turns it into a list data type in one go.
print(type(set(suburb)))

# Use 'set' function to remove duplicates, and the 'sorted' function to 
# get alphabetical order, this also turns the variable back into a list.
suburb_set = sorted(set(suburb))

#suburb_set = set(suburb)

print(type(suburb_set))
print(suburb_set)

suburb_list = list(suburb_set)

with open('new_data_files/suburbs.csv', 'w') as csvfile:
    wr = csv.writer(csvfile,  )
    wr.writerow(['suburb '])
    for item in suburb_list:
        wr.writerow([item])

csvfile.close()