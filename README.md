# College Football Analytics

## Introduction
College football fans, rejoice! Or sob uncontrollably? No matter your disposition or current mental health state, sports statistics provide abundant opportunities for data nerds to get lost in the numbers. And sometimes it's an added benefit (or curse!) if it's the team you happen to support.

But not so fast, my friends!

Data is usually spread out throughout the galaxy of the internet and sports media, making it difficult to get a full picture of the question you are attempting to answer. So where does that leave us, the college football faithful? Using [Sports Reference](https://sports-reference.com/), who "...democratizes data, so our users enjoy, understand, and share the sports they love."

The repo is going to be evolving and will include further applications and aspects of all things data. Keep following to see where this goes!

## Required Dependencies
The script utilizes the following libraries:
* Splinter - [Splinter Documentation](https://splinter.readthedocs.io/en/latest/)
* BeautifulSoup - [BeautifulSoup Documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
* pandas - [pandas Documentation](https://pandas.pydata.org/)
* NumPy - [NumPy Documentation](https://numpy.org/)
* SQLite - [SQLite Documentation](https://www.sqlite.org/docs.html)

## Other Requirements
Google Chrome is recommended for web scraping. If another browser is used, please remember to import the appropriate dependencies in the first cell.

## Coding and Script Notes
### Web Scraping Script Notes

Cell 3 inputs currently require the full school name with the start of each word capitalized. For example:
* Nebraska
* Iowa State
* Texas A&M


### ETL Notes
Cell 2 is your reference to the school name and link. If you have modified this, please change accordingly.



Cell 6 generates data for offensive stats, and Cell 7 generates data for defensive stats.

## Data Transform & Loading
### Coding Notes
The script takes the output csv file from the resources directory and cleans the data for database loading.  The webscrape inserted additional blank rows of data and also included some bowl games with no statistics.  The record needed to be broken apart into individual integers for the score and a string for either a W/L.  This will allow for charting and statistical operations on records.  

The cleaned data is loaded into a SQLite database with an offense and defense table.  For the scope of the project right now, it is sufficient to perform data analysis with .csv files.  The SQLite database creation will become more important once the script is expanded to include multiple teams in the database.
