# Bookmark Manager

An application for storing all of your important links in one place.

## Aim of Learning

To test drive connection to a database manually, as oppose to using an ORM, and use that database connection to support an application.

## Installation

`git clone git@github.com:telgi/boomark-manager-revisited.git`

Run `bundle install` to install gem dependencies

Run `rake setup` to create test and development databases

## How to Use

Run `ruby app.rb`

Navigate to `http://localhost:4567` to launch application from home page.

## How to Run Tests

Run `rspec spec/features` for feature tests

Run `rspec` for all tests, including unit tests

## User Stories

### Links

```
As a user,
So that I can save a new link and easily reference that new link,
I want to be able to add the new link with the site's address and a title.

As a user,
So that I can have easy access to all my regularly visited websites,
I want an application that stores a list of all these links.
```
![Alt text](assets/images/domain_model_mvc.JPG)
```
As a user,
So that I can get rid of links that I no longer need,
I want to be able to delete links from my list.

As a user,
So that I can edit the details of a link that has changed,
I want to be able to update any link in my list.
```

### Comments

```
As a user,
So that I can make useful notes about a particular link,
I want to be able to add a new comment to an existing link.
```

## Features

### Links

* The user can add a new link to their Bookmark Manager [x]
* The Bookmark Manager displays a list of links the user has added [x]
* The user can delete a link from their Bookmark Manager [x]
* The user can update a link in their Bookmark Manager [x]

### Comments

* The user can add a new comment to an existing link [x]

## Screenshot Example

![Alt text](assets/images/database_placeholder.jpg?raw=true "Screenshot placeholder image")

## Author

Terry Allitt
