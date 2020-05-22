# Honey, a quick MVC rails app w/ graph
## Manage your colony with confidence

### Technologies Used
* **Ruby** ('2.5.1')
* **Ruby on Rails** ('~> 5.1.6.2') — with Turbolinks
* **Postgres** ('~> 11.2')
* **HighCharts JS**
* **Faker**

---

### The Product 🐝
- Managing your worker bees has never been easier. Track nectar doses and pollen collected with a simple, easy-to-read graph and toggle between a regular and enhanced table to view bee data.
    <p align="center">
        <img src="app/assets/images/index_page.gif">
    </p>
### The Database 🐝
- Normalized the database in 3NF with no transitive functional dependencies

### The Graph 🐝
- Implemented HighCharts to visualize nectar dosage and pollen collected data
  <p align="center">
      <img src="app/assets/images/graph_grow.gif">
  </p> 
  <p align="center">
      <img src="app/assets/images/graph_highlight.gif">
  </p> 

### The Table 🐝
- Displayed a 'toggle-able' table to allow users to switch between Enhanced and Regular modes
  <p align="center">
      <img src="app/assets/images/table_toggle.gif">
  </p>
- Allow for Advisements to be Overruled (and Reaccepted) by a Cabeenet member via a custom button
    <p align="center">
        <img src="app/assets/images/overrule_button.gif">
    </p>
- Created a custom SQL query to combine relevant information
    ```
    @bee_table = ActiveRecord::Base.connection.execute(
            "SELECT nec.bee_id, nec.date_given, nectar_dosage, pollen_globs_collected,
            value, adv.id AS adv_id, nec.id AS nec_id, accepted
            FROM nectar_dosages AS nec
            LEFT OUTER JOIN pollen_collecteds AS pol
            ON nec.date_given = pol.date_collected
            LEFT OUTER JOIN advisements AS adv ON
            nec.date_given = adv.date_given
            WHERE nec.bee_id = #{@worker_bee.id} AND (pol.bee_id = #{@worker_bee.id} OR pol.bee_id is NULL) AND
            (adv.bee_id = #{@worker_bee.id} OR adv.bee_id is NULL) ORDER BY nec.date_given DESC")
    ```

### UI/UX Design 🐝
- Designed various interactive elements for a more intuitive user experience
    <p align="center" >
        <img src="app/assets/images/hover_underline.gif" width=200>
    </p> 
    <p align="center">
        <img src="app/assets/images/nav_bar.gif" width=200>
    </p>  
    <p align="center">
        <img src="app/assets/images/accept_button.gif" width=200>
    </p>