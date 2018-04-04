# Recipe Database

This is a super simple database for storing recipes.

## Entities

* user
* recipe
* ingedients
* steps
* category

## Logical Model

<img src="https://i.imgur.com/0FhAOJh" title="source: imgur.com" />

### Assumptions

* each ingredient is a new record which belongs to a single recipe
* at this level the units of measurement are part of the ingredient table. It could be seperated into its own referenece table.

## Physical Model

<img src="https://imgur.com/ISqV4vJ" title="source: imgur.com" />

https://imgur.com/ISqV4vJ

## Data Dictionary