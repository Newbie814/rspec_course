require 'rspec'
require 'selenium-webdriver'
require 'nokogiri'
require 'open-uri'

RSpec.describe 'Padding Test' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'https://example.com'  # Replace with the base URL of your website
  end

  after(:each) do
    @driver.quit
  end

  it 'should have padding of 5rem on every page' do
    visit_all_pages do |url|
      @driver.navigate.to url
      element = @driver.find_element(:css, '#element-id')  # Replace with the CSS selector of your target element
      padding = element.css_value('padding')

      expect(padding).to eq('5rem')
    end
  end

  def visit_all_pages
    visited_urls = []
    urls_to_visit = [@base_url]  # Start with the base URL

    while urls_to_visit.any?
      url = urls_to_visit.pop
      next if visited_urls.include?(url)  # Skip already visited URLs

      begin
        doc = Nokogiri::HTML(open(url))

        # Process the page and find links to other pages
        process_page(doc)

        yield url

        visited_urls << url
      rescue
        # Handle any errors that occur while visiting a page
        # You can choose to log, skip, or handle errors as needed
        puts "Error visiting: #{url}"
      end
    end
  end

  def process_page(doc)
    # Find and extract links from the current page
    links = doc.css('a')
    links.each do |link|
      href = link['href']

      # Check if the link is a relative URL and convert it to an absolute URL
      if href && !href.start_with?('http')
        href = URI.join(@base_url, href).to_s
      end

      # Add the URL to the list of pages to visit
      urls_to_visit << href if href.start_with?(@base_url)
    end
  end
end



If you don't know all the URLs of a website and still want to automate visiting each page, you can utilize a technique called web crawling or web scraping to discover and visit all the accessible pages on the website. Here's an example of an automation script in RSpec using the Nokogiri gem for web scraping:

ruby
Copy code
require 'rspec'
require 'selenium-webdriver'
require 'nokogiri'
require 'open-uri'

RSpec.describe 'Padding Test' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'https://example.com'  # Replace with the base URL of your website
  end

  after(:each) do
    @driver.quit
  end

  it 'should have padding of 5rem on every page' do
    visit_all_pages do |url|
      @driver.navigate.to url
      element = @driver.find_element(:css, '#element-id')  # Replace with the CSS selector of your target element
      padding = element.css_value('padding')

      expect(padding).to eq('5rem')
    end
  end

  def visit_all_pages
    visited_urls = []
    urls_to_visit = [@base_url]  # Start with the base URL

    while urls_to_visit.any?
      url = urls_to_visit.pop
      next if visited_urls.include?(url)  # Skip already visited URLs

      begin
        doc = Nokogiri::HTML(open(url))

        # Process the page and find links to other pages
        process_page(doc)

        yield url

        visited_urls << url
      rescue
        # Handle any errors that occur while visiting a page
        # You can choose to log, skip, or handle errors as needed
        puts "Error visiting: #{url}"
      end
    end
  end

  def process_page(doc)
    # Find and extract links from the current page
    links = doc.css('a')
    links.each do |link|
      href = link['href']

      # Check if the link is a relative URL and convert it to an absolute URL
      if href && !href.start_with?('http')
        href = URI.join(@base_url, href).to_s
      end

      # Add the URL to the list of pages to visit
      urls_to_visit << href if href.start_with?(@base_url)
    end
  end
end
# In this script, we use the Nokogiri gem to parse HTML and extract links from each visited page. The visit_all_pages method starts with the base URL, and while there are URLs to visit, it crawls the website by extracting links and adding them to the urls_to_visit array.

# The process_page method extracts links from the current page, converts relative URLs to absolute URLs, and adds them to the list of URLs to visit.

# The test case defined in the it block visits each page using the visit_all_pages method. It finds the target element using its CSS selector (replace '#element-id' with the actual CSS selector of your target element) and retrieves the computed value of the element's padding.

# The expect statement compares the retrieved padding value with the expected value of '5rem'.

# Ensure you have RSpec, Selenium WebDriver for Ruby, and the Nokogiri gem installed. Additionally, make sure you have the Chrome browser installed and the appropriate ChromeDriver executable set up. Modify the @base_url according to your website's URL, and run the script using an RSpec runner or the rspec command.