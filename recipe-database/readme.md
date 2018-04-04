# Recipe Database

This is a super simple database for storing recipes.

## Entities

* user
* recipe
* ingedients
* steps
* category

## Logical Model

![recipe logical model](recipe_logical_model.png "recipe logical model")

### Assumptions

* each ingredient is a new record which belongs to a single recipe
* at this level the units of measurement are part of the ingredient table. It could be seperated into its own referenece table.

## Physical Model

![recipe physical model](recipe_physical_model.png "recipe physical model")

![recipe physical model](https://i.imgur.com/0FhAOJh.png "recipe physical model")


## Data Dictionary