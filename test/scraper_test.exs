defmodule ScraperTest do
  use ExUnit.Case
  doctest Scraper

  def get_html() do
  	"<!doctype html>
		<html>
		<body>
		  <section id=\"content\">
		  	<h3 class=\"no-format inline italic-bolder font-20 dark-grey\">This is a title</h3>
		  	<h3 class=\"not-title inline italic-bolder font-20 dark-grey\">This is not a title</h3>
		    <p class=\"font-16 review-content margin-bottom-none line-height-25\">This is a review.</p>
		    <p class=\"font-16 not-review margin-bottom-none line-height-25\">This is not a review.</p>
		    <span class=\"italic font-18 black\">I am a user</span>
		    <span class=\"not-user font-18 black\">I am not a user</span>
		  </section>
		  <a href=\"https://hex.pm/packages/floki\">Hex package</a>
		</body>
		</html>"
  end

  #test "tests that get_review_entries(n) returns a list of lists of tuples" do
  #	result = Scraper.get_review_entries(5)
  #	assert is_list(result)
  #	assert is_list(Enum.at(result,0))
  #	assert is_tuple(Enum.at(Enum.at(result,0),0))
  #end

  #test "tests that get_review_entries(n) returns a list of length n" do
  #	n = 5
  #	result = Scraper.get_review_entries(n)
  #	assert length(result) == n
  #end

  test "tests get_string_from_floki(floki_list) returns the string content after Floki.find was called" do
  	html = get_html()
    |> Floki.find("p.review-content")
    |> Scraper.get_string_from_floki()
    assert String.valid?(html)
  end

  test "tests that get_review() extracts review text from html" do
  	html = get_html()
  	assert Scraper.get_review(html) == "This is a review."
  end

  test "tests that get_user() extracts user text from html" do
  	html = get_html()
  	assert Scraper.get_user(html) == "I am a user"
  end

  test "tests that get_title() extracts title text from html" do
  	html = get_html()
  	assert Scraper.get_title(html) == "This is a title"
  end

end
