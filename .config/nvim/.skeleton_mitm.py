"""
https://mitmproxy.readthedocs.io/en/v2.0.2/scripting/overview.html#a-simple-example
mitmproxy will auto reload this file on every write
"""
from mitmproxy import flowfilter
from mitmproxy import http, ctx
import json


def start():
    None
    # ctx.log.info("This is some informative text.")
    # ctx.log.warn("This is a warning.")
    # ctx.log.error("This is an error.")


def request(flow: http.HTTPFlow) -> None:
    None
    # flow.request.headers['reqheader'] = 'foo'
    # urlpath = flow.request.pretty_url
    # ctx.log.info(urlpath)
    # flow.request.json()  # Get body as json


def response(flow: http.HTTPFlow) -> None:
    None
    # flow.kill()  # kill this flow completly without forwarding at all
    # flow.response.headers["respheader"] = 'bar'
    # ctx.log.info(type(flow.response))
    # urlpath = flow.request.pretty_url
    # ctx.log.info(flow.request.pretty_url)
    # if (urlpath.find('getlokasinew') != -1):
    # 	jsonstr = flow.response.text
    # 	jsonObj = json.loads(jsonstr, encoding='utf-8', parse_int=True)
    # 	for lokasi in jsonObj['list_lokasi']:
    # 		ctx.log.info(lokasi['nama'])
    # 		ctx.log.info(lokasi['total_kuota'])
    # 		ctx.log.info(lokasi['status'])
    # 		lokasi['total_kuota'] = 4000
    # 		lokasi['status'] = 'Tersedia'
    # 	jsonObj['pesan'] = 'Sekarang semua lokasi selalu tersedia'
    # 	ctx.log.info(jsonObj)
    # 	flow.response.text = str(jsonObj)
    # flow.response.text=""
