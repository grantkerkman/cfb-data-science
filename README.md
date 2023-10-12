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

All webscraping scripts generate .csv files in the `resources` directory in addition to DataFrames.  The `school_stats_script` notebook needs user inputs for school name, initial year, and final year.  Currently, school names need to be capitalized.  Examples are below:
* Nebraska
* Iowa State
* Texas A&M

### ETL Notebooks Notes

(---TO DO---)

