# College Football Data Engineering and Analytics

## Introduction
College football fans, rejoice! Or sob uncontrollably? No matter your disposition or current mental health state, sports statistics provide abundant opportunities for data nerds to get lost in the numbers. And sometimes it's an added benefit (or curse!) if it is the team you happen to support.

But not so fast, my friends!
![Not so fast!](https://www.knoxnews.com/gcdn/presto/2018/08/28/PKNS/d141d18e-ee80-4e75-b515-4a89994f1522-0916_kcsp_espn27_ASB.JPG?crop=3283,1847,x367,y64&width=3200&height=1801&format=pjpg&auto=webp)

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

## Medium Posts

### Web Scraping for Insights in College Football - Summary

[Link to the article](https://medium.com/@grantkerkman/web-scraping-for-insights-in-college-football-1e259fa7bf40)

Article explores college football data through web scraping, emphasizing the importance of sports data in storytelling. Using Python, the author provides a script for generating a list of football programs from Sports Reference. The script, utilizing Splinter and BeautifulSoup, ensures accurate data extraction by inspecting HTML elements. A user script prompts input for school and years, generating URLs for scraping offensive statistics. The resulting data is stored in a Pandas DataFrame and a CSV file. The article concludes by hinting at upcoming sections on data cleaning, offering a comprehensive guide to exploring and analyzing college football statistics.

### Extract! Transform! Load! - A Guide to Data Engineering

[Link to the article](https://medium.com/@grantkerkman/extract-transform-load-cd949024dd56)

The article explores the data pipeline, starting with extraction using Python scripts for team statistics. The complexities of the data are illustrated, leading to the Transform phase. Pandas, NumPy, and SQLite libraries are employed to clean and manipulate the data. Article details the process of handling missing values, formatting issues, and converting data types. The article emphasizes the importance of thorough checks, highlighting the need to drop incomplete rows. The Load phase involves exporting the cleaned data to CSV files and an SQLite database.

### Understanding Your Data

[Link to the article](https://medium.com/@grantkerkman/understanding-your-data-6c776c863da6)

Delve into the nuances of data cleaning and analysis in Python with this insightful article. The author presents two unique cases, illustrating the challenges and solutions encountered when dealing with missing data in different datasets. The importance of subject matter expertise in data engineering is emphasized, showcasing the significance of understanding the context behind the data.

### Asking Questions and Getting More Questions

[Link to the article](https://medium.com/@grantkerkman/asking-questions-and-getting-more-questions-e39f8ccc6b3c)

Embark on a data analysis journey delving into Nebraska Football from 2000–2022 using SQL. The article covers essential data engineering tasks, including source data extraction, cleaning, transformation, and storage. The focus then shifts to SQL queries for insightful analysis. Explore aspects like game counts, offensive and defensive performances, turnovers, penalties, and team rankings. The author utilizes SQL commands to reveal trends, strengths, and weaknesses, offering a comprehensive view of Nebraska's football performance over the years.

### Sisyphus in Red: Analyzing Nebraska Cornhuskers Football

[Link to the article](https://medium.com/@grantkerkman/sisyphus-in-red-7c1ced5b0bee)

This article delves into the performance of the Nebraska Cornhuskers' football team through data analysis and K-means clustering. Using Greek mythology and existential philosophy, the author introduces the concept of the Absurd to make sense of the team's inconsistent trajectory. Python and Scikit-learn are employed for clustering, revealing three distinct performance groups across coaching eras. The analysis sheds light on Nebraska's position, despite historical success, and examines the challenges faced by coaches, including Scott Frost. The article concludes by suggesting a reassessment of fan expectations and offering a nuanced perspective on Nebraska's football journey.

## Code Documentation

### Web Scraping Script Notes

The `school_list` and `school_year` scripts do not need to be run until after the season to include any new schools competing this year and to include the 2023 season.

The `school_stats` script should be the first stop in selecting the school and years you want to analyze.  After you have scraped your data, you will fun the corresoponding `ETL Notebook` to clean and load the data.

All web scraping scripts generate .csv files in the `resources` directory in addition to DataFrames.  The `school_stats_script` notebook needs user inputs for school name, initial year, and final year.  Currently, school names need to be capitalized.  Examples are below:
* Nebraska
* Iowa State
* Texas A&M

### ETL Notebooks Notes

Every ETL script produces both a .csv and updates the database.  Special attention needs to be paid to the `standings_transform_loading` script, as dropping NaN columns in the incorrect order will elimate valid data.  Please follow the script in it's entirety.

The data pipeline is structured as follows:

![image](https://github.com/grantkerkman/cfb-data-engineering/assets/39035066/c797193b-bee7-43fc-9a9a-8968a7a7708f)

### Clustering Analysis
Run the entire notebook to produce two outputs:
* Plot of user selected statistics
* Dataset that includes k-means cluster groups (.csv file)

The analysis groups evey team that participated in College Football from 2000 through 2022 and grouped teams based on wins, losses, rank, strength of schedule, and points.  The graphs also allow for an individual school to be analyzed to determine which seasons belonged to the categorical group.  For a use case please visit [this Medium post.](https://medium.com/@grantkerkman/sisyphus-in-red-7c1ced5b0bee)

## Nebraska Football Analysis

This section highlights a use case for the project focusing on the Nebraska Cornhuskers.  For the most in-depth analysis, check out the Medium blog posts for specific examples and further analysis.

### Nebraska Analysis SQL Script

SQL script is included as an ad-hoc code snips for generating statistics and random facts for the Medium blog posts.

### Nebraska Analysis Unsupervised

K-means clustering analysis for the Nebraska Cornhuskers to highlight which coachese had the most impact on their team.  Dataset used was 2000 - 2022 team standings in the `standings.csv` file.  

### Nebraska Regression

Regression analysis to predict outcomes based on indvidual game statistics.  This script can be run using any team dataset using the `school_stats` webscraping script.  Regression model utilizes both offensive and defensive datasets and is currently predicting with ~70% accuracy.

## Contribution and Collaboration

I welcome contributions and collaboration from the college football community and data enthusiasts. If you'd like to get involved in making this project even better, here's how you can contribute:

### Contributing Code

1. Fork this repository to your GitHub account.
2. Clone the forked repository to your local machine.
3. Create a new branch for your feature or bug fix: `git checkout -b your-feature`.
4. Make your changes and commit them: `git commit -m 'Added a new feature'`.
5. Push the changes to your fork: `git push origin your-feature`.
6. Open a Pull Request (PR) to the `main` branch of this repository. Please provide a clear and descriptive title and a summary of your changes.

### Reporting Issues

If you encounter any issues or have suggestions for improvement, please open an issue on the GitHub repository. Be sure to include a detailed description of the problem or your idea for enhancement.
