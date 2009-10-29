ey-cloud-recipes
================
This is a collection of useful Chef recipes for use with Engine Yard's Cloud services. This will give you a brief overview of what you'll find in this repository and how to use it. Look for individual README files in each cookbook for more information on how that particular piece works.

Installation
============

Follow these steps to use custom deployment recipes with your applications:

* Download your ey-cloud.yml file from your EY Cloud [Extras][ey-extras] page and put it in your HOME directory ~/.ey-cloud.yml
* Install the required gems:<code><pre>sudo gem install rest-client aws-s3
sudo gem install ey-flex --source http://gems.engineyard.com</pre></code>
* Add any custom recipes or tweaks to the base recipes of your own and commit them to HEAD.
* Upload them with: `ey-recipes --upload ENV` (where `ENV` is the name of your environment in EY Cloud. This may be different than your Rails environment name.)
* Once you have completed these steps, each deployment will run the latest version of your recipes after the default Engine Yard recipes have run. When you update your recipes, just re-run the ey-recipes --upload ENV task.

Activating cookbooks
====================

In order to activate a cookbook, whether it is a custom-made one you wrote or one included with the project, you have to mark it for use in `cookbooks/main/recipes/default.rb`. If a cookbook is not explicitly loaded in that file it is merely sitting in the repository, and will *never* get run.

Included cookbooks
==================

The following cookbooks are included in the current version of ey-cloud-recipes:

* couchdb
* jruby
* mbari-ruby
* memcached -- _for customizing your memcached setup beyond the typical setup provided by EY Cloud_
* postgresql
* thinking_sphinx
* ultrasphinx

Please note that these cookbooks are provided on a completely unsupported, best-effort basis. They may break at any time and they may allow you to install programs that we will not provide any support for. While we believe them to be safe and useful the ultimate responsibility for making sure that these recipes work on your setup lies with you.

[ey-extras]: https://cloud.engineyard.com/extras
