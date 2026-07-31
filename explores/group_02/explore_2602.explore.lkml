# Update for 500 file diff target
# Explore: explore_2602
# Auto-generated LookML Explore File

include: "/views/domain_07/view_07807.view.lkml"
include: "/views/domain_09/view_07809.view.lkml"
include: "/views/domain_10/view_07810.view.lkml"
include: "/views/domain_11/view_07811.view.lkml"

explore: explore_2602 {
  label: "Explore Explore 2602"
  description: "Comprehensive analytics explore joining base view_07807 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07807
  
  always_filter: {
    filters: [view_07807.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07807.created_at_date: "7 days"]
    unless: [view_07807.id, view_07807.status]
  }

  join: view_07809 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07807.user_id} = ${view_07809.id} ;;
    required_joins: []
  }

  join: view_07810 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07807.account_id} = ${view_07810.account_id} ;;
    required_joins: [view_07809]
  }

  join: view_07811 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07807.category} = ${view_07811.category} ;;
  }

  access_filter: {
    field: view_07807.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07807.is_deleted} = false ;;
}
