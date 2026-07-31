# Update for 2000 file diff target
# Explore: explore_3870
# Auto-generated LookML Explore File

include: "/views/domain_11/view_11611.view.lkml"
include: "/views/domain_13/view_11613.view.lkml"
include: "/views/domain_14/view_11614.view.lkml"
include: "/views/domain_15/view_11615.view.lkml"

explore: explore_3870 {
  label: "Explore Explore 3870"
  description: "Comprehensive analytics explore joining base view_11611 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11611
  
  always_filter: {
    filters: [view_11611.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11611.created_at_date: "7 days"]
    unless: [view_11611.id, view_11611.status]
  }

  join: view_11613 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11611.user_id} = ${view_11613.id} ;;
    required_joins: []
  }

  join: view_11614 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11611.account_id} = ${view_11614.account_id} ;;
    required_joins: [view_11613]
  }

  join: view_11615 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11611.category} = ${view_11615.category} ;;
  }

  access_filter: {
    field: view_11611.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11611.is_deleted} = false ;;
}
