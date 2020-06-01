# https://developers.google.com/identity/protocols/oauth2/scopes

import requests
from oauth2client.service_account import ServiceAccountCredentials

SCOPES = ['https://www.googleapis.com/auth/cloud-translation']

def _get_access_token():
  """Retrieve a valid access token that can be used to authorize requests.

  :return: Access token.
  """
  credentials = ServiceAccountCredentials.from_json_keyfile_name(
      'service-account.json', SCOPES)
  access_token_info = credentials.get_access_token()
  return access_token_info.access_token

headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + _get_access_token(),
}

data = '{\n  \'q\': \'The Great Pyramid of Giza (also known as the Pyramid of Khufu or the\n        Pyramid of Cheops) is the oldest and largest of the three pyramids in\n        the Giza pyramid complex.\',\n  \'source\': \'en\',\n  \'target\': \'es\',\n  \'format\': \'text\'\n}'

response = requests.post('https://translation.googleapis.com/language/translate/v2', headers=headers, data=data)
print(response.text)