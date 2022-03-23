# ruangguru
### Setup
1. Install Homebrew on Mac
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

2. Install python3 and pip3
 - brew install python3
 - brew install pip3

2. Install robot framework
 - pip3 install robotframework
 - pip3 install robotframework-seleniumlibrary
 - pip3 install robotframework-requests
 - pip3 install robotframework-jsonlibrary

3. Install geckodriver or chromedriver
 - For Mac
   Please download geckodriver: https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-macos.tar.gz 
   or
   Chromedriver: https://chromedriver.storage.googleapis.com/
   The version is following your browser version
   Unzip file then copy > Goto Finder > cmd+shift+G > Go To Folder /usr/local/bin > paste your geckodriver or chromedriver in bin

### Running Features Test
 - robot -d report .\filename.robot
   Ex : robot -d "report" ./api_test.robot