# Explore: explore_3956
# Auto-generated LookML Explore File

include: "/views/domain_19/view_11869.view.lkml"
include: "/views/domain_21/view_11871.view.lkml"
include: "/views/domain_22/view_11872.view.lkml"
include: "/views/domain_23/view_11873.view.lkml"

explore: explore_3956 {
  label: "Explore Explore 3956"
  description: "Comprehensive analytics explore joining base view_11869 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11869
  
  always_filter: {
    filters: [view_11869.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11869.created_at_date: "7 days"]
    unless: [view_11869.id, view_11869.status]
  }

  join: view_11871 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11869.user_id} = ${view_11871.id} ;;
    required_joins: []
  }

  join: view_11872 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11869.account_id} = ${view_11872.account_id} ;;
    required_joins: [view_11871]
  }

  join: view_11873 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11869.category} = ${view_11873.category} ;;
  }

  access_filter: {
    field: view_11869.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11869.is_deleted} = false ;;
}
