Asana Statusboard
=================

> Display your Asana projects &amp; their details using Panic's Statusboard app.

This lightweight ruby app runs on sinatra and is ready to be deployed on Heroku. To complete the following setup, you will need:

1. Statusboard App for iPad
2. Git
2. Heroku
3. Basic knowledge of both
4. And a Heroku account

Setup
----

    git clone https://github.com/sheck/asana-statusboard.git
    cd asana-statusboard
    heroku create
    git push heroku master
    
Usage
-----

1. In Statusboard, add a new Table widget
2. Enter the following for your URL:

##### http://[your-app-name].herokuapp.com/[your-api-key]/[your-workspace-id]

Find your API key here: [http://app.asana.com/-/account_api](http://app.asana.com/-/account_api)

Find your workspace id here: [https://app.asana.com/api/1.0/users/me](https://app.asana.com/api/1.0/users/me)

Results
-------

If everything goes right, it should look similar to this

![Expected Results](http://f.cl.ly/items/1S2o0B061a0e0r1N2G0P/photo.JPG)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/sheck/asana-statusboard/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

