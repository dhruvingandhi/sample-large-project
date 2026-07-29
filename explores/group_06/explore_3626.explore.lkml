# Explore: explore_3626
# Auto-generated LookML Explore File

include: "/views/domain_29/view_10879.view.lkml"
include: "/views/domain_31/view_10881.view.lkml"
include: "/views/domain_32/view_10882.view.lkml"
include: "/views/domain_33/view_10883.view.lkml"

explore: explore_3626 {
  label: "Explore Explore 3626"
  description: "Comprehensive analytics explore joining base view_10879 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10879
  
  always_filter: {
    filters: [view_10879.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10879.created_at_date: "7 days"]
    unless: [view_10879.id, view_10879.status]
  }

  join: view_10881 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10879.user_id} = ${view_10881.id} ;;
    required_joins: []
  }

  join: view_10882 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10879.account_id} = ${view_10882.account_id} ;;
    required_joins: [view_10881]
  }

  join: view_10883 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10879.category} = ${view_10883.category} ;;
  }

  access_filter: {
    field: view_10879.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10879.is_deleted} = false ;;
}
