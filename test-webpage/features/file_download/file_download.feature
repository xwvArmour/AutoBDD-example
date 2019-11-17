@test-download
Feature: file download

  As a QA Engineer
  I want to open browser to download a few files and investigate file contents

  @SmokeTest
  Scenario: File Open and Download - check PDF file
    Given I delete all download files with the name "pdf-test.*"
    When  I open the url "http://www.orimi.com/pdf-test.pdf"
    Then  I should see the "Yukon_Logo" image on the screen
    When  I download the PDF file by clicking "PDF_download_icon"
    And   I wait on download file "pdf-test.pdf" for 5000ms to exist
    And   I open the download file "pdf-test.pdf"
    Then  I expect the downloaded file "pdf-test.pdf" contains exactly 18 lines
    And   I expect the downloaded file "pdf-test.pdf" contains more than 10 lines
    And   I expect the downloaded file "pdf-test.pdf" contains less than 20 lines
    And   I expect the downloaded file "pdf-test.pdf" at line 4 contains the text "PDF Test File"
    And   I expect the downloaded file "pdf-test.pdf" not contains the text "PDF Tast File"
    And   I expect the downloaded file "pdf-test.pdf" matches the text "Box \d{4}"

  Scenario: File Download - check XLS file
    Given I delete all download files with the name "file_example_XLS_10*"
    When  I open the url "https://file-examples.com/wp-content/uploads/2017/02/file_example_XLS_10.xls"
    And   I wait on download file "file_example_XLS_10.xls" for 5000ms to exist
    Then  I expect the downloaded file "file_example_XLS_10.xls" contains 10 rows
    And   I expect the downloaded file "file_example_XLS_10.xls" contains 10 rows and 8 columns
    And   I expect the downloaded file "file_example_XLS_10.xls" at row 0 contains the text "0,First Name,Last Name,Gender,Country,Age,Date,Id"
    And   I expect the downloaded file "file_example_XLS_10.xls" at row 1 and column 4 equals the text "United States"
