defmodule LabScrapWeb.CrawlerController do
  use LabScrapWeb, :controller


  def index(conn, _params) do
    render(conn, "index.html")
  end

  def run_1x1(conn, _params) do
    IO.puts("Running Crawler 1x1")
    LabScrap.ParallelCrawler.run_1x1
    render(conn, "crawler.html")
  end

  def run_pool_10(conn, _params) do
    IO.puts("Running Crawler Pool 10")
    LabScrap.ParallelCrawler.run_pool(10)
    render(conn, "crawler.html")
  end

end
