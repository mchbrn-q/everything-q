// create table
prices:([]fruit:`apple`pear`banana;quantity:100 250 200;price:0.95 1.23 0.74)

// save table as a flat table
save `:prices

// save table as a flat table but with a different file name
`:fruitorders set prices

// reload flat files to a session
fruitorders:get `:fruitorders
prices:load `:prices
// or
prices:\l `:prices

// create a new table
prices2:([]price:12.23 32.19 23.10;quantity:10 20 30;code:"ABC")

// save table as a splayed table
`:splayed_prices/ set prices2

// load a splayed table back into memory
get `:splayed_prices

// get column names of a splayed table
get `:splayed_prices/.d

// reorder the columns of a splayed table
`:splayed_prices/.d set `code`price`quantity

// reload a splayed table and see the difference
load `:splayed_prices
splayed_prices

// get data from a column of a splayed table
get `:splayed_prices/price

// add a new column to a splayed table
`:splayed_prices/date set 2022.08.08 2022.08.15 2022.08.22

// update .d file to record new column
`:splayed_prices/.d set `price`quantity`code`date
load `:splayed_prices

// delete a column from a splayed table
hdel `:splayedprices/date

// update .d to reflect deleted column
`:splayed_prices/.d set `price`quantity`code
load `:splayed_prices

// add a new row to a splayed table
`:splayed_prices/ upsert (44.2;25;"D")
load `:splayed_prices

// order table in place
`quantity xasc `:splayed_prices

// create a new table
prices3:([]price:43.2 67.4 83.2;quantity:45 32 40;code:"BBA")

// save two tables as a table partitioned by date
`:part_price/2020.08.08/price/ set prices2
`:part_price/2020.08.09/price/ set prices3

// load table back into memory and show full table
\l part_price
price

// access rows 1 and 2 of a partitioned table with an absolute index
.Q.ind[price;1 2]

// after creating a directory of for a missing date, fill it with the columns used in partitioned table
.Q.chk[`:.]

// sym columns must first be enumerated
// unique symbols are mapped to an index
// the syms and indices are contained within the sym file

// create a table with sym columns 
mensa:([]case_name:`nominative`vocative`accusative`genitive`dative`ablative;singular:`mensa`mensa`mensam`mensae`mensae`mensa;plural:`mensae`mensae`mensas`mensarum`mensis`mensis)

// saved it as a partitioned table
`:latin/mensa/ set .Q.en[`:latin;mensa]

// load partitioned sym table back into memory
load `:latin/mensa
mensa

// to save a splayed table into a database partition use .Q.dpft
// the table has to be define in the global namespace to use this function
// arguments are db directory, db partition, the column to sort and apply parted attribute to and table
.Q.dpft[`:hdb;2020.08.10;`case_name;`mensa]

// save all tables defined in the global namespace to historical database and purge all data in the tables
// 0 is the historical port and `fruit is the enumerated column
.Q.hdpf[0;`:hdb;2020.08.11;`fruit]
