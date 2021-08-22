#!/usr/bin/env python

import asyncio
import aiohttp
from bs4 import BeautifulSoup as BS


async def main():
    async with aiohttp.ClientSession() as session:
        resp = await session.get('')
        assert resp.status == 200
        page = BS(await resp.text(), 'html5lib')
        links = page.find_all('', attrs={'class': ''})
        print(links)
    pass


if __name__ == '__main__':
    asyncio.run(main())
