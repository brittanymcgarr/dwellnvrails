# dwellNV Rails App
For organizing and managing listings and clients.

## Commands

Gem bundle install without production:

```
$ bundle install --without production
```

Database migration:

```
$ rails db:migrate
```

Rails testing suite:

```
$ rails test
```

Rails local server:

```
$ rails server
```

Heroku from Branch:

```
$ git checkout master
$ git merge static-pages
$ git push
$ rails test
$ git push heroku
$ heroku run rails db:migrate
```

Rails Active Record (db commands):

Rails Console (Sandbox mode):
```
$ rails console --sandbox
```

Creating a new User:
```
$ user = User.new(name:"Name", email:"email@email.com")
$ user.save

-or-
$ user = User.create(name: "Name", email: "email@email.com")
```

Destroying a User entry:
```
$ user.destroy
```

Checking validity:
```
$ user.valid?
```

Finding User:
```
$ User.find(1)
$ User.find_by(name: "Name")
$ User.first
$ User.all
```

So, uploading multiple images is not working for the individual listings, however, there was an interesting workaround I came up with: use HTML! It's easy enough to understand, and at the worst, you can use the sample below for each image you want to add. Upload the images you want to a service, such as Google Drive or give them to me to upload to the Amazon Web Services account that we use for the site right now. From there, you will get a URL (web address in the top bar of your browser). Insert it where it says "http..." between quotes when you create the listing's description. The main image will still work for the listing.

Adding images to a Listing:
1.) Log in and go to your Dashboard
2.) Click on Create a Listing
3.) Fill out the information
4.) Upload the image to a service and record the URL
5.) In the Description area, write an image tag or use the example:

<a href="https://dwellnv.s3.amazonaws.com/uploads/listing/picture/4/kitchen.jpg"><img src="https://dwellnv.s3.amazonaws.com/uploads/listing/picture/4/kitchen.jpg" alt="The Kitchen!" height="250" width="350"></img></a>

6.) Repeat 4-5 for each image you want for the listing
7.) Click Create Listing

Adding a Team Member or Admin:
1.) Log in and go to your Dashboard
2.) Click on the Clients panel
3.) Locate the User you wish to upgrade and click on Edit
4.) Check Admin AND Team options to upgrade the User

Admins can help manage the site and create listings. Admin and Team members will appear in the Team information panel on the About Us section. Team members can write biographies and upload a picture of themselves for the panel.

Creating Testimonials
1.) Log in as an admin and navigate to https://www.dwellnv.com/testimonials/new
2.) Fill out the Description and choose a picture to upload
3.) Click Create Testimonial

The testimonial will join the pool of existing testimonials which are randomly selected for display on the splash panel on each page. To edit a testimonial, navigate to its number and edit: https://www.dwellnv.com/testimonials/1/edit
Note that "1" represents the ID of the testimonial you wish to edit.

