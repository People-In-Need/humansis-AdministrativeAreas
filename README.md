# ADM list

Files in folder locations are used to update ADM locations on PIN environments. There are in this public repo because we need some mechanism to update ADM without deploying new app. There is command `app:adm:update` which will retrieve data from this repo and update database locations


## Workflow for updating ADM
1) Create feature branch on this repo
2) Make standard merge request and merge after code review
3) Login into AWS console on desired environment and run `php -d memory_limit=-1 ./bin/console app:adm:update` and select XML file which you want to use to update locations.
