# Explore: explore_3889
# Auto-generated LookML Explore File

include: "/views/domain_18/view_11668.view.lkml"
include: "/views/domain_20/view_11670.view.lkml"
include: "/views/domain_21/view_11671.view.lkml"
include: "/views/domain_22/view_11672.view.lkml"

explore: explore_3889 {
  label: "Explore Explore 3889"
  description: "Comprehensive analytics explore joining base view_11668 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11668
  
  always_filter: {
    filters: [view_11668.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11668.created_at_date: "7 days"]
    unless: [view_11668.id, view_11668.status]
  }

  join: view_11670 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11668.user_id} = ${view_11670.id} ;;
    required_joins: []
  }

  join: view_11671 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11668.account_id} = ${view_11671.account_id} ;;
    required_joins: [view_11670]
  }

  join: view_11672 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11668.category} = ${view_11672.category} ;;
  }

  access_filter: {
    field: view_11668.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11668.is_deleted} = false ;;
}
