# Update for 500 file diff target
# Explore: explore_2502
# Auto-generated LookML Explore File

include: "/views/domain_07/view_07507.view.lkml"
include: "/views/domain_09/view_07509.view.lkml"
include: "/views/domain_10/view_07510.view.lkml"
include: "/views/domain_11/view_07511.view.lkml"

explore: explore_2502 {
  label: "Explore Explore 2502"
  description: "Comprehensive analytics explore joining base view_07507 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07507
  
  always_filter: {
    filters: [view_07507.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07507.created_at_date: "7 days"]
    unless: [view_07507.id, view_07507.status]
  }

  join: view_07509 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07507.user_id} = ${view_07509.id} ;;
    required_joins: []
  }

  join: view_07510 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07507.account_id} = ${view_07510.account_id} ;;
    required_joins: [view_07509]
  }

  join: view_07511 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07507.category} = ${view_07511.category} ;;
  }

  access_filter: {
    field: view_07507.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07507.is_deleted} = false ;;
}
