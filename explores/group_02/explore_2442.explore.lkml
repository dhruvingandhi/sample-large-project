# Update for 500 file diff target
# Explore: explore_2442
# Auto-generated LookML Explore File

include: "/views/domain_27/view_07327.view.lkml"
include: "/views/domain_29/view_07329.view.lkml"
include: "/views/domain_30/view_07330.view.lkml"
include: "/views/domain_31/view_07331.view.lkml"

explore: explore_2442 {
  label: "Explore Explore 2442"
  description: "Comprehensive analytics explore joining base view_07327 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07327
  
  always_filter: {
    filters: [view_07327.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07327.created_at_date: "7 days"]
    unless: [view_07327.id, view_07327.status]
  }

  join: view_07329 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07327.user_id} = ${view_07329.id} ;;
    required_joins: []
  }

  join: view_07330 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07327.account_id} = ${view_07330.account_id} ;;
    required_joins: [view_07329]
  }

  join: view_07331 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07327.category} = ${view_07331.category} ;;
  }

  access_filter: {
    field: view_07327.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07327.is_deleted} = false ;;
}
