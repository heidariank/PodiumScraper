defmodule Scraper do
  @moduledoc """
  A Scraper written for Podium code challenge.
  Author: Kelsey Heidarian
  This scrapes the specified number of pages of reviews from the McKaig Dealership page
  on dealerrater.com and prints the top three most positive reviews to the console.
  """

  @doc """
  ## Scraper first 5 pages of reviews
  ## iex> Scraper.main(5)

  username: - ds4321
  review title: "Great Experience"
  review text: Robin was great. Jeremy was great. Adrian was great. Sabrina was great. Very good down to earth people who made me feel welcome and did a great job.
  review positivity score: 0.595
  ====================
  username: - Ozell8353:54
  review title: "Best dealer around"
  review text: Adrian was very helpful and courteous. I told him what I wanted and the price range I had. He met my needs perfectly. Excellent customer service. Love my new Equinox!!
  review positivity score: 0.495
  ====================
  username: - denzil
  review title: "Mike done a great job finding my truck a great man well come"
  review text: Mike did a great job  finding my truck a great man will tell my  friends was a great experience thanks 
  well come back when I am in need for another vehicle Thanks Mike and all the staff, great doing business with you all. 
  review positivity score: 0.492
  ====================
  :ok


  """
  #Returns review entries from specified number of pages from McKaig Dealership page on dealer rater
  def get_review_entries(num_pages) do
    for n <- 1..num_pages do
      HTTPoison.get!("https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page"<>Integer.to_string(n)).body
      |> Floki.find("div.review-entry")
    end
  end

  #Extracts and returns only the text portion from a tuple produced by Floki.find
  def get_string_from_floki(floki_list) do
    floki_list
    |> Enum.map(fn(tup) -> elem(tup, 2) end)
    |> Enum.at(0)
    |> Enum.at(0)
  end

  #Returns the review content from a posted review
  def get_review(html) do
    html
    |> Floki.find("p.review-content")
    |> get_string_from_floki()
  end

  #Returns the user who wrote the review
  def get_user(html) do
    html
    |> Floki.find("span.italic")
    |> get_string_from_floki()
  end

  #Returns the title of the reveiw
  def get_title(html) do
    html
    |> Floki.find("h3.no-format")
    |> get_string_from_floki()
  end

  def main(num_pages) do
    review_entries = get_review_entries(num_pages)

    entries = 
    for page <- review_entries do
      for entry <- page do
        review = get_review(Floki.raw_html(entry))
        user = get_user(Floki.raw_html(entry))
        title = get_title(Floki.raw_html(entry))

        [review, user, title]
      end
    end

    entries = List.insert_at([], 0, entries)

    {:ok, pid} = :python.start([{:python_path, to_charlist(Path.expand("python"))}, {:python, 'python'}])
    module = :sentiment #python module to call 
    function = :analyze # function in module
    :python.call(pid, module, function, entries)
    :python.stop(pid)

  end

end
