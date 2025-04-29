# calibre_news_scheduler

Schedule the download of news in the calibre as and when you want.

Structure<br/>
.<br/>
├── calibre-server.service: The service<br/>
├── install.sh: Installs service and schedules cronjob<br/>
├── LICENSE: Yes<br/>
├── news.sh: Run at your scheduled time to download and add news<br/>
└── README.md: This file<br/>

# Setup steps
- Download the folder
- Run the install.sh
- Change the news.sh to add your custom sources

### Important:
The names in the news.sh should be exact. To list all the names, you can use ```ebook-convert --list-recipes``` in the CLI.