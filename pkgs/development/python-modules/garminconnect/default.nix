{ lib
, buildPythonPackage
, cloudscraper
, fetchFromGitHub
, pythonOlder
, requests
}:

buildPythonPackage rec {
  pname = "garminconnect";
  version = "0.1.49";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "cyberjunky";
    repo = "python-garminconnect";
    rev = "refs/tags/${version}";
    hash = "sha256-K9Q4Ce6agDgjP5rzXVK/koD51IyYKLLnd7JyrOxBs20=";
  };

  propagatedBuildInputs = [
    cloudscraper
    requests
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "garminconnect"
  ];

  meta = with lib; {
    description = "Garmin Connect Python API wrapper";
    homepage = "https://github.com/cyberjunky/python-garminconnect";
    changelog = "https://github.com/cyberjunky/python-garminconnect/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
