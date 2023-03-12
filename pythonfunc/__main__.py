import sys

def main(dict):

    # log pip packages
    import pkg_resources
    for dist in pkg_resources.working_set:
        print(dist.project_name, dist.version)
        

    import feedparser
    url = dict.get('url')
    if url is None:
        return { 'error': 'url is required' }
    feed = feedparser.parse(url)
    if feed.bozo:
        return { 'error': feed.bozo_exception.getMessage() }
    return { 'body': feed }