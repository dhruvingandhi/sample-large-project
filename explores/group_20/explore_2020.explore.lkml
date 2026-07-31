# Update for 2000 file diff target
# Explore: explore_2020
# Auto-generated LookML Explore File

include: "/views/domain_11/view_06061.view.lkml"
include: "/views/domain_13/view_06063.view.lkml"
include: "/views/domain_14/view_06064.view.lkml"
include: "/views/domain_15/view_06065.view.lkml"

explore: explore_2020 {
  label: "Explore Explore 2020"
  description: "Comprehensive analytics explore joining base view_06061 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06061
  
  always_filter: {
    filters: [view_06061.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06061.created_at_date: "7 days"]
    unless: [view_06061.id, view_06061.status]
  }

  join: view_06063 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06061.user_id} = ${view_06063.id} ;;
    required_joins: []
  }

  join: view_06064 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06061.account_id} = ${view_06064.account_id} ;;
    required_joins: [view_06063]
  }

  join: view_06065 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06061.category} = ${view_06065.category} ;;
  }

  access_filter: {
    field: view_06061.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06061.is_deleted} = false ;;
}
