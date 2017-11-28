import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.tokenize import sent_tokenize
from operator import itemgetter

'''
Parameter: reviews - a list of lists, each containing lists of [<review text>, <username>, <title>]
returns a list of tuples formatted like: ([<review text>, <username>, <title>], <positivity score>)
Note: positivity score is based on review text and review title
'''
def get_positivity_scores(reviews):
	review_scores = []
	analyzer = SentimentIntensityAnalyzer()
	for page in reviews:
		for rev in page:
			sentence_list = sent_tokenize(rev[0])
			compound_total = 0.0
			for sent in sentence_list:
				ss = analyzer.polarity_scores(sent)
				compound_total += ss['compound']
			#take the title of the review into account
			ss = analyzer.polarity_scores(rev[2])
			compound_total += ss['compound']

			num_sents = len(sentence_list)+1

			score = compound_total / num_sents
			review_scores.append((rev, score))

	return review_scores

'''
Prints top 3 reviews with username title and compound positivity score
'''
def analyze(reviews):
	review_scores = get_positivity_scores(reviews)
	#sort descending by second item in tuple
	sort_tupe = sorted(review_scores, key=itemgetter(1), reverse=True)
	
	for i in range(0,3):
		print('username: ' + sort_tupe[i][0][1])
		print('review title: ' + sort_tupe[i][0][2])
		print('review text: ' + sort_tupe[i][0][0])
		print('review positivity score: {0:.3f}'.format(sort_tupe[i][1]))
		print('====================')