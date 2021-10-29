# README

**Crypto Portfolio**

This is a simple API for
registering transactions made on three types of cryptocurrencies:
Bitcoin,Ethereum and Ripple.For every registered transaction a
current market value in Euro will be displayed.
The user is required to fill every input except for the date
The date is automatically set to be today's date. If user decides to
change the date they can set the new date manually from the date-picker.
After saving the form the data is saved to the backend. The current market value
is calculated by using queried data from bitfinex API.
Lastly,
User is given the possibility to delete the desired transaction,
after pressing the delete option user is prompted to confirm his/her action
and finally the transaction is removed from the table.

**Backend**

-Ruby on Rails Framework

**Schema**

- PortfolioTransactions

  - amount
  - location
  - curreny(fk)
  - date

- CryptoCurrency

  - name
  - code

**Frontend**

- Vue.js Framework

**Deployment**
DigitalOcean Droplets Linux-based virtual machine.
Both backend and frontend are built into Docker containers and pushed to
a repository. The docker-compose.yml file is copied to the designated
VM and is configured to run the PostgreSql database, Rails backend and Vue.js
dist files. Backend and frontend images are pulled from Gitlab and Postgres 12
is pulled from docker hub.
