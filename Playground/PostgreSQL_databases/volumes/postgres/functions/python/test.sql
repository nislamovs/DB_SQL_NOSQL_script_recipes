CREATE EXTENSION IF NOT EXISTS plpython3u; -- https://www.crunchydata.com/blog/getting-started-with-postgres-functions-in-plpython


CREATE OR REPLACE FUNCTION url_quote (url text)
    RETURNS TEXT
AS $$
    from urllib.parse import quote
    return quote(url)+"23234234"

$$
LANGUAGE 'plpython3u';

SELECT url_quote('https://www.postgresql.org/docs/12/plpython-data.html#id-1.8.11.11.3');

------------------------------------------------------------------------------------------------------------------------

CREATE EXTENSION IF NOT EXISTS plpython3u;

CREATE OR REPLACE FUNCTION get_request (url text)
    RETURNS TEXT
    LANGUAGE 'plpython3u'
AS $$
    import pycurl
    import certifi
    from io import BytesIO

    buffer = BytesIO()
    c = pycurl.Curl()
    c.setopt(c.URL, url)
    c.setopt(c.WRITEDATA, buffer)
    c.setopt(c.CAINFO, certifi.where())
    c.perform()
    c.close()

    body = buffer.getvalue()
    return body.decode('iso-8859-1')

$$;

SELECT get_request('https://ss.com/');