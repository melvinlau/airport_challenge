# The Airport App

## What this app does

This app controls the flow of planes at airports. Planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## System requirements

This app requires Ruby 2.6 or later installed on your computer.

## How to install

To download this app, clone this repository to your local machine.  How to do this: Open your command line interface (e.g. Terminal), navigate to the directory where you want to store this app, then paste in the following command:

```shell
git clone git@github.com:melvinlau/airport_challenge.git
```

## How to use

### How to run and exit the app

In your command line interface, `cd` into the `airport_challenge` directory, start `irb` ('Interactive Ruby'), load the app using `require "./lib/controller"` and you're good to go.

```shell
irb
2.6.0 :001 > require "./lib/controller"
 => true
```

To exit the app, type `exit` and hit return.  This will bring you back to your command prompt.

```shell
2.6.0 :002 > exit
```

### Creating planes and airports

This program comprises two main classes of objects: `Plane` and `Airport`. To create (instantiate) planes and airports, use the following commands. Note that their names such as `my_plane` and `heathrow` can be anything you like.

```ruby
my_plane = Plane.new
heathrow = Airport.new
```

When a new plane is instantiated, by default it is assumed to be flying (yes, we make them out of thin air).

### Airport capacities

Each airport is assumed to have a default capacity of 50 planes.  To override this, you can assign a capacity when you create an airport instance.  For example, to create an airport called `denver` and assign it a capacity of 75 planes, do this:

```ruby
denver = Airport.new(75)
```

### Instructing planes to land or take off

To land a plane at an airport that you specify, use the following command.  In this example, I'm landing `my_plane` at `heathrow` airport.

```ruby
my_plane.land(heathrow)
```

Similarly, to instruct a plane to take off from a given airport:

```ruby
my_plane.take_off(heathrow)
```

### Easy, wasn't it?

Create as many planes and airports as you want, and have a play around.  Be realistic though: don't try to take off a plane from an airport it isn't in, and don't ask a plane that's landed to land again because that's just... not possible.

You can view the planes at a given airport at any time by calling the method `.planes` on an airport. For example, to see what planes are in `heathrow`, do:

```ruby
heathrow.planes
```

### What you can't do

You can't land or take off a plane at an airport if the local weather is stormy, which lucky for you happens only 20% of the time. You also can't land a plane at an airport that is at full capacity.

&nbsp;

---

# Progress Report on the Airport challenge

Manual feature tests indicate the program is working as it should, and all the RSpec unit tests are passing.

I have managed to isolate the unit tests in `./spec/airport_spec.rb`.  However, if I had more time I would do the following:

- isolate unit tests in `./spec/plane_spec.rb` using mocks and stubs
- if possible, extract repetitive test code into a module and use it as a mixin

---

Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
