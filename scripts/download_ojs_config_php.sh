#!/bin/bash

source .env && wget "https://github.com/pkp/ojs/raw/${OJS_VERSION}/config.TEMPLATE.inc.php" -O ./volumes/config/ojs.config.inc.php