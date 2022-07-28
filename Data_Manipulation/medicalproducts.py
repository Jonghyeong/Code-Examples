import requests
from bs4 import BeautifulSoup


headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36'}
url = 'http://medicalproductguide.com/companies/15913/a-&-d-engineering-inc'

r = requests.get(url)
soup = BeautifulSoup(r.text, 'html.parser')

pod = soup.find('h1', {'class':'txtblue detailtitle'}).text
# company = soup.find('td',{'br'}).find_all('br')
# company = soup.find_all('br')

umdc_code = soup.find_all('table', {'class':'grid'})
print(umdc_code)
