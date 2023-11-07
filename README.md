# College Football Data Engineering and Analytics

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
* Scikit Learn - [Scikit Learn Documentation](https://scikit-learn.org/0.21/documentation.html)

## Other Requirements
Google Chrome is recommended for web scraping. If another browser is used, please remember to import the appropriate dependencies in the first cell.

## Start Here

The `school_list` and `school_year` scripts do not need to be run until after the season to include any new schools competing this year and to include the 2023 season.

The `school_stats` script should be the first stop in selecting the school and years you want to analyze.  After you have scraped your data, you will fun the corresoponding `ETL Notebook` to clean and load the data.

## Coding and Script Notes
### Web Scraping Script Notes

All web scraping scripts generate .csv files in the `resources` directory in addition to DataFrames.  The `school_stats_script` notebook needs user inputs for school name, initial year, and final year.  Currently, school names need to be capitalized.  Examples are below:
* Nebraska
* Iowa State
* Texas A&M

### ETL Notebooks Notes

Every ETL script produces both a .csv and updates the database.  Special attention needs to be paid to the `standings_transform_loading` script, as dropping NaN columns in the incorrect order will elimate valid data.  Please follow the script in it's entirety.

The data pipeline is structured as follows:

![image](https://github.com/grantkerkman/cfb-data-engineering/assets/39035066/c797193b-bee7-43fc-9a9a-8968a7a7708f)

## Analysis Scripts
### SQL Script
[[[TO DO]]]

## Contribution and Collaboration

We welcome contributions and collaboration from the college football community and data enthusiasts. If you'd like to get involved in making this project even better, here's how you can contribute:

### Contributing Code

1. Fork this repository to your GitHub account.
2. Clone the forked repository to your local machine.
3. Create a new branch for your feature or bug fix: `git checkout -b your-feature`.
4. Make your changes and commit them: `git commit -m 'Added a new feature'`.
5. Push the changes to your fork: `git push origin your-feature`.
6. Open a Pull Request (PR) to the `main` branch of this repository. Please provide a clear and descriptive title and a summary of your changes.

### Reporting Issues

If you encounter any issues or have suggestions for improvement, please open an issue on the GitHub repository. Be sure to include a detailed description of the problem or your idea for enhancement.
