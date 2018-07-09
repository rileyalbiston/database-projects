import csv

def stuff():
	'''
	This script takes public wifi csv from Brisbane Open Data and Coverts the Suburb column into
	uppercase. This is done because the suburb column in the database is used for the foregin key
	and must match in all tables.
	'''
	file = open('original_data_files/publicwi-fi20180417-1.csv')
	file_content = list(csv.DictReader(file))
	file_content[:2]


	for i in range(len(file_content)):
	    file_content[i]['Suburb'] = file_content[i]['Suburb'].upper()
	  

	print("Length of Dict:", len(file_content), "\n")  
	print(file_content[295:301])


	with open('new_data_files/wifi_upper_suburb.csv', 'w') as csvfile:
	    header_names = ['Wifi Hotspot Name', 'Address', 'Suburb' , 'Latitude', 'Longitude', 'Site']
	    wr = csv.DictWriter(csvfile, fieldnames=header_names, lineterminator='\n')
	 
	    wr.writeheader()
	    for value in file_content:
	        wr.writerow({'Wifi Hotspot Name' : value['Wifi Hotspot Name'], 'Address' : value['Address'], 'Suburb' : value['Suburb'], 'Latitude' : value['Latitude'], 'Longitude' : value['Longitude'], 'Site' : value['Site']})


def main():
	stuff()


if __name__ == '__main__':
	main()