# Explore: explore_3694
# Auto-generated LookML Explore File

include: "/views/domain_33/view_11083.view.lkml"
include: "/views/domain_35/view_11085.view.lkml"
include: "/views/domain_36/view_11086.view.lkml"
include: "/views/domain_37/view_11087.view.lkml"

explore: explore_3694 {
  label: "Explore Explore 3694"
  description: "Comprehensive analytics explore joining base view_11083 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11083
  
  always_filter: {
    filters: [view_11083.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11083.created_at_date: "7 days"]
    unless: [view_11083.id, view_11083.status]
  }

  join: view_11085 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11083.user_id} = ${view_11085.id} ;;
    required_joins: []
  }

  join: view_11086 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11083.account_id} = ${view_11086.account_id} ;;
    required_joins: [view_11085]
  }

  join: view_11087 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11083.category} = ${view_11087.category} ;;
  }

  access_filter: {
    field: view_11083.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11083.is_deleted} = false ;;
}
