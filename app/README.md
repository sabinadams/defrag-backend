# Welcome to Defrag Backend!

This is the official repo for Defrag's backend. Everything in this repo is to be kept private!!


# Prerequisites

CommandBox: https://www.ortussolutions.com/products/commandbox

MySQL/MySQL Server (Temporary): https://dev.mysql.com/downloads/mysql/

MySQL Workbench (Temporary): https://dev.mysql.com/downloads/workbench/

### Suggested Tools

Postman: https://www.getpostman.com/postman

VSCode: https://code.visualstudio.com/

  1. https://marketplace.visualstudio.com/items?itemName=ilich8086.ColdFusion

  2. https://marketplace.visualstudio.com/items?itemName=ortus-solutions.vscode-testbox


## Installation (assumes all prerequisites have been met)

1. Clone repo
2. cd into the repo and run `box` to open the CommandBox shell
3. Run `install` and then `start` to install all dependencies and start the local server
4. Navigate to http://127.0.0.1:8500/lucee/admin/server.cfm if it doesn't open automatically (may have to wait a minute) set up your password. 
5. Go into the [Datasources](http://127.0.0.1:8500/lucee/admin/server.cfm?action=services.datasource) tab and set up a new datasource pointing to your local mysql server's Defrag database
6. Setup is done! Navigate to http://localhost:8500/ to see the Taffy Dashboard

## Current Tech (Frameworks, Languages, Tools, etc...)
![Lucee Logo](https://avatars0.githubusercontent.com/u/10973141?v=3&s=400)
![CommandBox Logo](https://www.ortussolutions.com/__media/commandbox-185-logo.png)
![TestBox Logo](http://www.tavanpouya.com/img/trr.png)
![ForgeBox Logo](https://www.ortussolutions.com/__media/ForgeBox300.png)
![Docker Logo](https://www.ybrikman.com/assets/img/blog/docker/docker-logo.png)
![MySQL Logo](https://logos-download.com/wp-content/uploads/2016/05/MySQL_logo_small.png)

