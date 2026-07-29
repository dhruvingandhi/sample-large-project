# Explore: explore_3303
# Auto-generated LookML Explore File

include: "/views/domain_10/view_09910.view.lkml"
include: "/views/domain_12/view_09912.view.lkml"
include: "/views/domain_13/view_09913.view.lkml"
include: "/views/domain_14/view_09914.view.lkml"

explore: explore_3303 {
  label: "Explore Explore 3303"
  description: "Comprehensive analytics explore joining base view_09910 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09910
  
  always_filter: {
    filters: [view_09910.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09910.created_at_date: "7 days"]
    unless: [view_09910.id, view_09910.status]
  }

  join: view_09912 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09910.user_id} = ${view_09912.id} ;;
    required_joins: []
  }

  join: view_09913 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09910.account_id} = ${view_09913.account_id} ;;
    required_joins: [view_09912]
  }

  join: view_09914 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09910.category} = ${view_09914.category} ;;
  }

  access_filter: {
    field: view_09910.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09910.is_deleted} = false ;;
}
