# Update for 2000 file diff target
# Explore: explore_2338
# Auto-generated LookML Explore File

include: "/views/domain_15/view_07015.view.lkml"
include: "/views/domain_17/view_07017.view.lkml"
include: "/views/domain_18/view_07018.view.lkml"
include: "/views/domain_19/view_07019.view.lkml"

explore: explore_2338 {
  label: "Explore Explore 2338"
  description: "Comprehensive analytics explore joining base view_07015 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07015
  
  always_filter: {
    filters: [view_07015.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07015.created_at_date: "7 days"]
    unless: [view_07015.id, view_07015.status]
  }

  join: view_07017 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07015.user_id} = ${view_07017.id} ;;
    required_joins: []
  }

  join: view_07018 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07015.account_id} = ${view_07018.account_id} ;;
    required_joins: [view_07017]
  }

  join: view_07019 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07015.category} = ${view_07019.category} ;;
  }

  access_filter: {
    field: view_07015.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07015.is_deleted} = false ;;
}
