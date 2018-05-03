import geoplotlib
thedata = geoplotlib.utils.read_csv('data_files/wifi_upper_suburb.csv')
geoplotlib.dot(thedata)
geoplotlib.show()