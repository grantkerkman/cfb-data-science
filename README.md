# Web Scraping College Football Statistics

## Introduction
College football fans, rejoice! Or sob uncontrollably? No matter your disposition or current mental health state, sports statistics provide abundant opportunities for data nerds to get lost in the numbers. And sometimes it's an added benefit (or curse!) if it's the team you happen to support.

But not so fast, my friends!

Data is usually spread out throughout the galaxy of the internet and sports media, making it difficult to get a full picture of the question you are attempting to answer. So where does that leave us, the college football faithful? Using [Sports Reference](https://sports-reference.com/), who "...democratizes data, so our users enjoy, understand, and share the sports they love."

The repo is going to be evolving and will include further applications. Keep following to see where this goes!

## Required Dependencies
The script utilizes the following libraries:
* Splinter - [Splinter Documentation](https://splinter.readthedocs.io/en/latest/)
* BeautifulSoup - [BeautifulSoup Documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
* pandas - [pandas Documentation](https://pandas.pydata.org/)
* NumPy - [NumPy Documentation](https://numpy.org/)

## Other Requirements
Google Chrome is recommended for web scraping. If another browser is used, please remember to import the appropriate dependencies in the first cell.

## School List Web Scraping Script
### Coding Notes
The webpage will sometimes load a table in the `tables` object that is an ad for a game being played that current week and there is no pattern for how many will display. If you run into issues with the script, you can investigate the output of cell 3 to verify you are calling the correct table or you can call the last object in the list:

```
for row in tables[-1].find_all('tr'):
```

The output is a .csv file with school names and the URL link to be used in the next script. If you are having issues with the above section of code, a version of the .csv file is already in the resources directory.

## User Script
### Coding Notes
Cell 2 is your reference to the school name and link. If you have modified this, please change accordingly.

Cell 3 inputs currently require the full school name with the start of each word capitalized. For example:
* Nebraska
* Iowa State
* Texas A&M

Cell 6 generates data for offensive stats, and Cell 7 generates data for defensive stats.
