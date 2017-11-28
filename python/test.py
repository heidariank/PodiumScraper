import unittest
from sentiment import get_positivity_scores
import types

class SentimentTestCase(unittest.TestCase):
	def get_reviews(self):
		return [
		[["I love everything!", "user1", "Title1"], ["I hate everything!", "user2", "Title2"]],
		[["I neither love nor hate everything.", "user3", "Title3"], ["I love everything but sometimes I also hate it.", "user4", "Title4"]]
		]

	"""Tests that get_positivity_scores() returns a list of tuples containing
		([<review text>, <username>, <title>], <positivity score>)`."""
	def test_get_positivity_scores_type(self):
		reviews = self.get_reviews()
		result = get_positivity_scores(reviews)
		self.assertTrue(type(result) is types.ListType)
		print result
		for item in result:
			self.assertTrue(type(item) is types.TupleType)
			self.assertTrue(type(item[0]) is types.ListType)
			self.assertTrue(type(item[1]) is types.FloatType)


if __name__ == '__main__':
    unittest.main()