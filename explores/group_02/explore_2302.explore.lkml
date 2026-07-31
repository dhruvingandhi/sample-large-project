# Update for 500 file diff target
# Explore: explore_2302
# Auto-generated LookML Explore File

include: "/views/domain_07/view_06907.view.lkml"
include: "/views/domain_09/view_06909.view.lkml"
include: "/views/domain_10/view_06910.view.lkml"
include: "/views/domain_11/view_06911.view.lkml"

explore: explore_2302 {
  label: "Explore Explore 2302"
  description: "Comprehensive analytics explore joining base view_06907 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06907
  
  always_filter: {
    filters: [view_06907.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06907.created_at_date: "7 days"]
    unless: [view_06907.id, view_06907.status]
  }

  join: view_06909 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06907.user_id} = ${view_06909.id} ;;
    required_joins: []
  }

  join: view_06910 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06907.account_id} = ${view_06910.account_id} ;;
    required_joins: [view_06909]
  }

  join: view_06911 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06907.category} = ${view_06911.category} ;;
  }

  access_filter: {
    field: view_06907.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06907.is_deleted} = false ;;
}
