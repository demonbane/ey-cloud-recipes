UltraSphinx
===========

The ultrasphinx cookbook handles the following tasks:

* Logrotate script for sphinx logs
* ERB templates for creating a suitable `monitrc` and `sphinx.yml`
* The recipe that describes what to do with the templates

To use it you just need to modify `recipes/default.rb` to include your application name. This is the name of your application as EY Cloud knows it, **not** necessarily the name of your repository or anything else. Look for the `run_for_app` line towards the top of the recipe and change `<app_name>` to be your application name instead.

Once you're done don't forget to add your recipe to the main recipe (in `../main/recipes/default.rb`) and then deploy it using `ey-recipes --upload ENV` (where `ENV` is the name of your environment in EY Cloud). Once you run `ey-recipes` your custom recipes are ready and will be used at the next deploy.
