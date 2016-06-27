# Different Response Types

The goal of this assignment is to practice making a Rails app respond to requests for different types of data besides just HTML.

Start by forking [this repository](https://github.com/bitmakerlabs/booklist), which contains the start of a simple Rails app that holds a list of books.

We've given you a `Book` model, some routes, and a home page that consists of four links that request the list of all books but in different data types: HTML, plain text, CSV, and JSON.  

To begin with none of the links will work, and **your task is to make them functional by adding the appropriate code to your controller**.

Before you get going, you'll need to run `bundle exec rake db:seed` to populate your database with some books.

Don't forget to commit after each step!


## Step 1: Normal HTML response

Start by creating an index view and controller method the way you are used to and then verify that it works by clicking on the first link ('See list of books') on the app's home page.


## Step 2: Add a `respond_to` block

Now that the first link is working as expected, let's refactor it to use a [`respond_to`](http://api.rubyonrails.org/classes/ActionController/MimeResponds.html#method-i-respond_to) block. This sets us up to be able to respond with different data formats for the same list of books.

Once you've added the `respond_to` block with an HTML format, everything should work exactly as it did in Step 1!

Verify that the 'See list of books' link still works, then commit your changes.


## Step 3: Add a plain text response

Ok, now let's make things interesting. We're going to add another data format: plain text (the most exciting data format ever!).

There are two steps to making this work. The first step is to let the controller know that text is a supported response type. The second step is to create a new view to render when the text format is requested.

The controller will look for a view with an extension that matches the data type requested (e.g. `index.html.erb` if the requested data type was HTML). We can create a view called `index.text.erb` that the controller will find in the case that the client asked for plain text. It's still an `erb` file so you can use alligator tags to embed Ruby code, you just can't use any HTML tags (**plain** text, remember?).

Create your text view and test out the first two links in your browser to make sure they work.


## Step 4: Add a CSV response

CSV (Comma-separated values) is a really common file type that is easily imported into any spreadsheet program. Here's a small example of a CSV file:

```csv
id,title,author,already_read
1,The Secret History,Donna Tartt,true
2,Why's (Poignant) Guide to Ruby,Why the Lucky Stiff,true
3,Pink Noises,Tara Rodgers,false
```

Instead of creating new files in the views folder for each data type we want to respond with, we can add a block of code inside of the `respond_to` with instructions on how to construct the response.

```ruby
respond_to do |format|
  # ... other formats here

  format.csv do
    # ...
  end
end
```

To speed things up and stay focused, we added a small method to your model to generate a CSV representation of the Books in your database.

```ruby
def self.generate_csv(book_list)
  header = ['id', 'title', 'author', 'already_read']

  CSV.generate(headers: true) do |csv|
    csv << header

    book_list.each do |book|
      csv << [book.id, book.title, book.author, book.already_read]
    end
  end
end
```

Now it's your job to call that method in the `format.csv` block to return the CSV representation of your list of books when it's requested. To make sure it's returned as the response to the request, you'll need to read through and understand [the `render :plain` method that Rails provides](http://guides.rubyonrails.org/layouts_and_rendering.html#rendering-text).


## Step 5: Adding a JSON response

Finally, add another format block for a JSON response. [Turns out Rails has you covered here too.](http://guides.rubyonrails.org/layouts_and_rendering.html#rendering-json) Many winnings!

Test out that all four of your links work and respond with the correct data types and you, my friend, are done.

Commit and push this bad boy to GitHub.


## Stretch Assignment

Now that you know how to add different response types for your data, go back and add some different response types to the actions in your Rainforest and/or Seat Yourself projects.
