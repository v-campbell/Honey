# Quick MVC rails app w/ graph

### Technologies explored (check the skeleton)
* **Ruby** ('2.5.1')
* **Ruby on Rails** ('~> 5.1.6.2') — with Turbolinks
* **Postgres** ('~> 11.2')
* **HighCharts JS** — [here's an example][highcharts example]
* **Faker**
* _Don't_ use a frontend library like **React**
* Whatever engineering principles you think help you solve this best

---

### The Goal 🐝
Despite being an endangered species, bumble bees have evolved their hive
mentality to be capable of implementing a Quality Management System. Queens now
keep track of performance metrics for all their loyal subjects. One particular
Queen has taken initiative to modernize her hive with data-driven, actionable
insights.

The goal is to build, at minimum, a single show view (Identification page) for
the average `WorkerBee` in the Hive.

### The Details
1. This specific Hive is organized by `Comb`s.

2. Each Comb has any number of WorkerBees in it, supervised by a member of
   the Queen's Cabeenet.

3. WorkerBees collect `PollenGlob`s for their Comb

4. WorkerBees consume `Nectar` (for energy). Ideally, a WorkerBee will collect
   as many PollenGlobs as she can while using as little Nectar as possible.

5. A WorkerBee may get moved around the Hive to different Combs, but is only
   active in one Comb at a time. Each WorkerBee has a `unique_id` for each Comb
   they have been in or are currently active within (i.e., `WBee1-C1`,
   `WBee2-C2`, `WBee1-C2`).

6. Recently, the Queen and a team of PhBs developed an **algorithm** to manage
   Nectar consumption based off of historical PollenGlob collection.

### The Data Points
WorkerBees' success is tracked through PollenGlobs and Nectar allowance within
each Comb.

(Both metrics are recorded with corresponding dates.)

  `PollenGlob`s: The amount of pollen the WorkerBee has retrieved so far in each
                 week.

  * Measured about **once weekly** and with a pollen/globs (p/g) value of
    somewhere between **5.0 - 17.9**.

  `Nectar`: Given in measured amounts to the WorkerBees to boost productivity:
            too much may cause negative side effects — it's like Bee coffee.

  * Nectar is given **two to three times a week** at somewhere between
    **200 - 20_000** nectar units (units): divisible by 100

  * Nectar is **skipped about 5-10% of the time**, maybe for holidays, PTO,
    unexpected air traffic, etc.

  There is a strong correlation between Nectar intake and PollenGlobs collected.

  `SweetSpot`: Each Comb has a particular target range of PollenGlobs per
               WorkerBee, usually between **10.0 p/g to 15.0 p/g**.

  `Advisement`s: The output of the very beefficient algorithm, which determines
                 if a WorkerBee needs a change in Nectar allowance: used by the
                 member of the Cabeenet, i.e., If a WorkerBee's PollenGlobs drop
                 below a particular Comb's SweetSpot, an Advisement will likely
                 increase their Nectar allowance.

  * Advisements are given **every couple of weeks** or so per WorkerBee.

  * Advisements are either `accepted` or `overruled`.

**_NB:_** There are many different ways to organize this data given the above
          (and below) items. More tables is not necessarily a bad thing,
          provided they make sense and nothing is overly cluttered.


### The Design Specs (MVP)

There are 3 parts to complete. The Queen wants to be able to both **read** and
**visualize** each WorkerBee's data within the app.

The Show View should consist of the following:
 1. [ ] Identification page for the WorkerBee and to which Comb the current
        metrics apply

 2. [ ] A Graph of the WorkerBee's aforementioned metrics over time

 3. [ ] A Table (with 1-2 view modes (**Enhanced**, and optionally: **Regular**)

---

###  WorkerBee Show View (Identification page)
Display relevant `WorkerBee` information useful to identify the WorkerBee within
the current Comb. Use your best judgment for information the Queen and her
Cabeenet would like to see.

**_NB:_** We use [Slim templating](http://slim-lang.com/) for our main frontend
          setup, which is an alternative to erb with "simpler" syntax. It is
          fairly easy to pick up, and fun and/or useful depending on personal
          preferences, but not mandatory.

#### Graph
  * Located at the **top portion** of the page.
  * Display both PollenGlobs and Nectar in one chart.
  * Choose the best way to display this chart. Below is a rudimentary mock
    visual of connected points combined with a bar graph.
  * Remember the end user: very busy bees. Everything should be clear and easy
    to read/parse.
  * Requires that some variables pass from Ruby to JavaScript.

  **_NB:_** Exchanging variables is easily accomplished in a variety of ways.
            One of the easier ways uses a gem called `gon`.
  **_NB 2:_** Highcharts provides _really_ good examples and docs so setting up
              initially is not difficult.

```

  ┌──────────────────────────────────────────────────────────────────────┐
  │                                                                      │▒
  │       ╔═══════════╗                        .●◟                       │▒
  │       ║ ...       ║                      ,'   ╰◟                     │▒
  │       ╚═════════▿═╝                    ,'       `╮                   │▒
  │                 ●─.          ●────────●           ╲                  │▒
  │                ◜   `─.    ,─'                      `◟,               │▒
  │               ╱       ╲  ╱                            ╲              │▒
  │   ●────●     ╱         ◝●                              ●             │▒
  │         ╲   ╱                                                 █  █   │▒
  │          ╲ ╱                                          █  █    █  █   │▒
  │           ●   █                                       █  █    █  █   │▒
  │      █  █  █  █    █  █      █  █ █      █  █         █  █    █  █   │▒
  │      █  █  █  █    █  █      █  █ █      █  █         █  █    █  █   │▒
  │      █  █  █  █    █  █      █  █ █      █  █         █  █    █  █   │▒
  └──────────────────────────────────────────────────────────────────────┘▒
   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

```


#### Table
  * Located at the **bottom portion** of the page.
  * At minimum, please display the Enhanced view mode:
    * Calculate the percentage of Advisements accepted (see below)
  * Organize the data in conjunction with the graph

Example row structures below:

##### Enhanced view mode:
|  ID | ID-CombID |  Date  |PollenGlobs|   Nectar  |Advisement |% Accepted|
|:---:|:---------:|:------:|:---------:|:---------:|:---------:|:--------:|
| 123 | 123-C137  |02-29-20| 10.3 p/g  | 900 units |    n/a    |   100%   |
| 123 | 123-C137  |02-27-20|  n/a      | 900 units | 900 units |   100%   |
| 123 | 123-C137  |02-25-20|  9.0 p/g  |  0  units |    n/a    |    50%   |
| 123 | 123-C137  |02-22-20|  n/a      | 600 units |    n/a    |    67%   |
| 123 | 123-C137  |02-19-20|  n/a      | 600 units |    n/a    |    50%   |
| 123 | 123-C137  |02-16-20| 10.4 p/g  | 200 units | 600 units |    0%    |


##### How to calculate `% Accepted`
  * Calculate the percent of accepted Advisement amounts based on Nectar given
    compared to the **active Advisement:**
    * **An Advisement should be considered active** from the **date it is
      created** until the **next Advisement is created**.
      * With an Advisement of 900 units and a given Nectar amount of
        900 units, the Advisement is **accepted**.
      * If an Advisement is for 900 units and the given Nectar amount is not
        900 units, the Advisement is not accepted.
    * In the example above, the first Advisement is active from the bottom row
      through the fourth row up from the bottom
  * This calculated value should update whenever a new Nectar amount is added:
    **(please reference the example table above)**


##### Optional Regular view mode (allow toggle between two table view modes):
  * Include a toggle feature between this mode and the enhanced mode.
  * Show a more accessible table with less information in this mode.
  * Allow for Advisements to be Overruled by a Cabeenet member via a button and
    a form delivered in any chosen medium (modal/partial/view/etc).

|  Date  | PollenGlobs |   Nectar  | Advisement |       Overrule      |
|:------:|:-----------:|:---------:|:----------:|:-------------------:|
|02-29-20|  10.3 p/g   | 900 units |     n/a    |                     |
|02-27-20|  n/a        | 900 units |  900 units |**[Edit Advisement]**|
|        |             |    ...    |            |                     |

---

### Some Advice
  * Don't mess with timestamps for `date`. Don't hack around with `created_at`
    or anything, use a single-responsibility column.
  * Separate the calculation of `% Accepted` to an ActiveSupport Concern: don't
    clutter the model(s)/controller(s) with this logic. (It's a simple way
    to improve readability of larger, more complicated applications.)
  * Ensure the high charts function is clean and makes sense for this mini app
  * Leaning heavily on docs examples is fine: just ensure good, unique code
  * Learn some new things
  * Have fun!

### Helpful checklist

  * [ ] _Instantiate a **github repo** when you **begin the challenge**._
  * [ ] Please **make the repo private**, and _invite us_.
  * [ ] Make an initial skeleton 💀 state commit.
  * [ ] **Commit frequently** and push at least at the end of each day worked.
  * [ ] Please **provide a readme** (other than this one) explaining your
        decisions/actions where you have something to say.
  * [ ] **Include screenshots** (in that readme) of what your mini app looks
        like!
  * [ ] Maybe (please) include some helpful seed data. `Faker` _could_ help you
        there.
  * [ ] **Mention any other tech** you pulled in to help you if you did so.
  * [x] Read this challenge readme.


### Our Part

  * We'll clone your app locally and run the usual `bundle exec...` `foo`,
    `bar`, etc. to set up the app and db so we can have a look at what you've
    built.
  * We ~~probably~~ won't fix 🚫🛠 anything or run anything to clean up code:
  * Please ensure style/readability 📖✅ is decently tidy!

### Thank you for reading, and Happbee coding 🐝 🙌 🐝


[highcharts example]: https://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/demo/bar-stacked/
