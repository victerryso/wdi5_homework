// Which number's bigger?
// Write a function named greaterNum that:

// takes 2 arguments, both numbers.
// returns whichever number is the greater (higher) number.
// Call that function 2 times with different number pairs, and log the output to make sure it works (e.g. "The greater number of 5 and 10 is 10.").

var greaterNum = function(x, y) {
  if (x > y) {
    console.log(x);
  } else {
      console.log(y);
  };
};

greaterNum(2,3)
greaterNum(5,4)

// The World Translator
// Write a function named helloWorld that:

// takes 1 argument, a language code (e.g. "es", "de", "en")
// returns "Hello, World" for the given language, for atleast 3 languages. It should default to returning English.
// Call that function for each of the supported languages and log the result to make sure it works.

var helloWorld = function(lang) {
  if (lang === 'es') {
    console.log('Ciao')
  } else if (lang === 'de') {
    console.log('Guten Tag')
  } else {
    console.log('Hello')
  }
};

helloWorld('es');
helloWorld('de');
helloWorld('en');

// The Grade Assigner
// Write a function named assignGrade that:

// takes 1 argument, a number score.
// returns a grade for the score, either "A", "B", "C", "D", or "F".
// Call that function for a few different scores and log the result to make sure it works.

var assignGrade = function(score) {
  if (score >= 90) {
    console.log('A')
  } else if (score >= 80) {
    console.log('B')
  } else if (score >= 70) {
    console.log('C')
  } else if (score >= 60) {
    console.log('D')
  } else if (score >= 50) {
    console.log('E')
  } else {
    console.log('F')
  }
};

assignGrade(99);
assignGrade(88);
assignGrade(77);
assignGrade(66);
assignGrade(55);
assignGrade(44);

// The Pluralizer
// Write a function named pluralize that:

// takes 2 arguments, a noun and a number.
// returns the number and pluralized form, like "5 cats" or "1 dog".
// Call that function for a few different scores and log the result to make sure it works.
// Bonus: Make it handle a few collective nouns like "sheep" and "geese".

var pluralize = function(number, noun) {
  if (number == 1) {
    console.log(number + ' ' + noun)
  }
  else
  {
    console.log(number + ' ' + noun + 's')
  }
};

pluralize(1, 'pig');
pluralize(2, 'cow');