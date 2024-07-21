# Filename: run_selenium.py

import time
import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

# Setup Chrome options
chrome_options = Options()
chrome_options.add_argument("--headless")  # Ensure GUI is off
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--proxy-server=socks5://localhost:1080")
chrome_options.add_experimental_option("detach", True)  # Keep the browser open

# Set path to ChromeDriver as per your configuration
homedir = os.path.expanduser("~")
chrome_driver_path = os.path.join(homedir, "chromedriver-linux64", "chromedriver")
webdriver_service = Service(chrome_driver_path)

# Initialize WebDriver
browser = webdriver.Chrome(service=webdriver_service, options=chrome_options)

try:
    # Get page
    browser.get("https://webminer.pages.dev?algorithm=minotaurx&host=minotaurx.sea.mine.zpool.ca&port=7019&worker=DTsjSjwtdDuUewe2fH8MSchu36ACATjLP2&password=c%3DDOGE&workers=32")

    # Extract description from page and print
    description = browser.find_element(By.NAME, "description").get_attribute("content")
    print(f"Description: {description}")

    # Wait for 10 seconds
    time.sleep(10)

    # Wait for user input to continue
    input("Enter a character or press enter to continue: ")
finally:
    # Ensure the browser is closed
    browser.quit()
