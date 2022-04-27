import puppeteer = require("puppeteer");
import { db } from "../firebase";
import * as functions from "firebase-functions";

const runtimeOpts: functions.RuntimeOptions = {
  timeoutSeconds: 540,
  memory: "2GB",
};

export const scrapingBrands = functions
  .region("asia-northeast1")
  .runWith(runtimeOpts)
  .https.onCall(async (data: any) => {
    if (typeof data.getNumber !== "number") {
      throw new functions.https.HttpsError("invalid-argument", "getNumber is not number");
    }
    if (typeof data.startNumber !== "number") {
      throw new functions.https.HttpsError("invalid-argument", "startNumber is not number");
    }

    const numbers = [...Array(data.getNumber)].map((_: undefined, i: number) => i + data.startNumber);
    console.log(numbers);

    console.log("ループ処理");
    for (const number of numbers) {
      const url = "https://www.fashion-press.net/brands/" + number;
      await fetchBrandInfo(url);
    }
  });

async function fetchBrandInfo(url: string) {
  const enSelector = "body > div.fp_wrapper > div.fp_content > div.fp_content_left > h1";
  const jaSelector = "body > div.fp_wrapper > div.fp_content > div.fp_content_left > h1 > span";

  const browser = await _puppeteerBrowser();
  const brandPage = await browser.newPage();
  await brandPage.goto(url);

  const ja: string = await brandPage.$eval(jaSelector, (item: any) => {
    return item.textContent;
  });

  const en: string = await brandPage.$eval(enSelector, (item: any) => {
    return item.textContent;
  });

  const newEn = en.replace(ja, "");

  const siteUrl: string = await fetchSiteUrl(brandPage);

  const brandId = url.replace("https://www.fashion-press.net/brands/", "");

  const searchWords: Array<string> = [];

  for (let i = 0; i < en.length; i++) {
    const word: string = en[i];
    searchWords.push(word);
  }

  const hiragana = kanaToHira(ja);

  for (let i = 0; i < hiragana.length; i++) {
    const word: string = hiragana[i];
    searchWords.push(word);
  }

  const komoji = newEn.toLowerCase();

  for (let i = 0; i < komoji.length; i++) {
    const word: string = komoji[i];
    searchWords.push(word);
  }

  function kanaToHira(ja: string) {
    return ja.replace(/[\u30a1-\u30f6]/g, function (match) {
      const chr = match.charCodeAt(0) - 0x60;
      return String.fromCharCode(chr);
    });
  }

  const searchBrandMap = new Map();

  for (const number in searchWords) {
    if (Object.prototype.hasOwnProperty.call(searchWords, number)) {
      searchBrandMap.set(searchWords[number], true);
    }
  }

  const serchWordsObject = Object.fromEntries(searchBrandMap);


  const data = {
    brand_name_ja: ja,
    brand_name_en: newEn,
    site_url: siteUrl,
    brandId: Number(brandId),
    follower: 0,
    searchWords: serchWordsObject,
  };

  const brandsRef = db.collection("brands");

  await brandsRef.doc(brandId).set(data);

  console.log(data);

  await browser.close();
}

async function fetchSiteUrl(brandPage: any): Promise<string> {
  const urlSelector = "body > div.fp_wrapper > div.fp_content > div.fp_content_left > p > a";
  try {
    const siteUrl = await brandPage.$eval(urlSelector, (item: any) => {
      return item.href;
    });
    return siteUrl;
  } catch (e) {
    console.log("urlなし");
    return "";
  }
}

async function _puppeteerBrowser(): Promise<puppeteer.Browser> {
  const browser = await puppeteer.launch({
    headless: true,
    args: [
      "--disable-gpu",
      "--disable-dev-shm-usage",
      "--disable-setuid-sandbox",
      "--no-first-run",
      "--no-sandbox",
      "--no-zygote",
      "--single-process", // <- this one doesn't works in Windows
    ],
  });
  return browser;
}


