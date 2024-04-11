connection: "finance_data"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: ecommerce_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ecommerce_demo_default_datagroup

explore: bqml_model_info {}
explore: function {}

explore: employee {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: electronics_sales {
  join: users {
    type: left_outer
    sql_on: ${electronics_sales.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: distribution_centers {}

explore: cfips_location {}

explore: connection_reg_r3 {}

explore: irs_990_2015 {}

explore: irs_990_2012 {}

explore: irs_990_2016 {}

explore: irs_990_2014 {}

explore: irs_990_ein {}

explore: irs_990_2017 {}

explore: irs_990_2013 {}

explore: irs_990_ez_2012 {}

explore: irs_990_ez_2015 {}

explore: irs_990_ez_2013 {}

explore: irs_990_ez_2016 {}

explore: irs_990_ez_2017 {}

explore: irs_990_ez_2014 {}

explore: irs_990_pf_2013 {}

explore: irs_990_pf_2012 {}

explore: irs_990_pf_2014 {}

explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: irs_990_pf_2015 {}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: test_model_input_data_model_training {}

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: irs_990_pf_2016 {}

explore: tab {
    join: tab__addresses {
      view_label: "Tab: Addresses"
      sql: LEFT JOIN UNNEST(${tab.addresses}) as tab__addresses ;;
      relationship: one_to_many
    }
}

explore: temporary {}

explore: test_model_input_data_selected {}

explore: users {}
