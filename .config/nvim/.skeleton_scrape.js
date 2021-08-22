const puppeteer = require('puppeteer');
const jq = require('puppeteer-jquery');
// require('dotenv').config();

// if (!process.env.KLIKBCA_USER && !process.env.KLIKBCA_PASS) {
//   return console.log('Please edit .env file with your credential');
// }

var page = undefined;

async function main() {
  const browser = await puppeteer.launch();
  page = await browser.newPage();
  await page.goto('', {waitUntil : 'networkidle0', timeout : 0});
  const bodyHeight = await page.evaluate(() => document.body.scrollHeight);
  await page.setViewport({
    width : 1920,
    height : bodyHeight,
  });
  // await page.waitForSelector('form');
  // await page.waitForSelector('input[type = "submit"]');
  // await page.type('input#email', 'mail2@mail.com');
  // await page.click('input[type = "submit"]');
  // await page.waitForTimeout(3000);
  await page.screenshot({path : 'screenshot.png', fullPage : true});
  console.log('Screenshot: klikbca-in.png');
  // res = await page.evaluate(() => {
  //   return document.body.children[1]
  //       .children[1]
  //       .contentDocument.body.getElementsByTagName('table')[4]
  //       .outerHTML;
  // });
  // console.log(res);
  // await do_logout(page);
  // await page.waitForTimeout(2000);
  // await page.screenshot({path : 'klikbca-out.png'});
  await browser.close();
}

main();
