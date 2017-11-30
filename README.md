# McKaig Review Scraper

Scrapes the specified number of pages of reviews from the McKaig Dealership page
on dealerrater.com and prints the top three most positive reviews to the console.
The positivity of the review text and the title is rated using a sentiment intensity
analyzer from nltk. The analyzer give a score for positivity, negativity, neutrality
and a compound score that is the overall positive and negative score. The scraper uses
the compound score for each sentence and takes an average for the whole review, then ranks
the reviews based on this average.

## Getting Started

To run this scraper from source, clone this repository to your machine:

```
git clone https://github.com/heidariank/PodiumScraper.git
cd PodiumScraper
```

### Prerequisites

The project uses elixir libraries floki, httpoison and erlport. Run:

```
mix deps.get
```

It also relies on the nltk library for Python. Ensure this is installed. Visit [Installing NLTK](http://www.nltk.org/install.html) for instructions.

### Using the Scraper

Compile the project and start the interactive elixir shell:

```
iex -S mix
```

To run the scraper, type the command:

```
iex()> Scraper.main(n)
```

Where n is the number of review pages you would like to scrape. Output will appear like this:
```
username: - denzil
review title: "Mike done a great job finding my truck a great man well come"
review text: Mike did a great job  finding my truck a great man will tell my  friends was a great experience thanks 
well come back when I am in need for another vehicle Thanks Mike and all the staff, great doing business with you all. 
review positivity score: 0.932
====================
username: - Plowboy
review title: "Awesome experience"
review text: Mckaig Chevrolet is an awesome place people are so friendly Adrian Cortez is a great guy to work with he works hard and works for your needs I will definitely by there again I don't see any reason to go anywhere else
review positivity score: 0.782
====================
username: - Tanisha Wilson
review title: "MOST AMAZING "
review text: Everyone that has sonething to do with this place and my purchase has am A+ such caring and wonderful people I am grateful and most thankful for everything 
review positivity score: 0.778
====================

```

## Running the tests

Run elixir tests with:

```
mix test
```

Since the scraper relies on the nltk library for Python there are Python tests too. Change into the python directory and run the tests with:

```
python test.py
```

## Authors

* **Kelsey Heidarian** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)