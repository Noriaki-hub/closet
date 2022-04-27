const searchBrandMap = new Map();

const searchWords = ['a', 'b'];

  for (const number in searchWords) {
    if (Object.prototype.hasOwnProperty.call(searchWords, number)) {
      searchBrandMap.set(searchWords[number], true);
    }
  }

  const serchWordsObject = Object.fromEntries(searchBrandMap);

  console.log(serchWordsObject)