# Scraper

**Scrapes the specified number of pages of reviews from the McKaig Dealership page
  on dealerrater.com and prints the top three most positive reviews to the console.**

  The positivity of the review text and the title is rated using a sentiment intensity
  analyzer from nltk. The analyzer give a score for positivity, negativity, neutrality
  and a compound score that is the overall positive and negative score. Because the 
  sentiment analyzer was trained on single sentences, I take the compound score for
  each sentence and take an average for the whole review and rank the reviews based on 
  this average.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `scraper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:scraper, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/scraper](https://hexdocs.pm/scraper).

