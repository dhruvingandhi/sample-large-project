# Explore: explore_1956
# Auto-generated LookML Explore File

include: "/views/domain_19/view_05869.view.lkml"
include: "/views/domain_21/view_05871.view.lkml"
include: "/views/domain_22/view_05872.view.lkml"
include: "/views/domain_23/view_05873.view.lkml"

explore: explore_1956 {
  label: "Explore Explore 1956"
  description: "Comprehensive analytics explore joining base view_05869 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05869
  
  always_filter: {
    filters: [view_05869.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05869.created_at_date: "7 days"]
    unless: [view_05869.id, view_05869.status]
  }

  join: view_05871 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05869.user_id} = ${view_05871.id} ;;
    required_joins: []
  }

  join: view_05872 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05869.account_id} = ${view_05872.account_id} ;;
    required_joins: [view_05871]
  }

  join: view_05873 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05869.category} = ${view_05873.category} ;;
  }

  access_filter: {
    field: view_05869.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05869.is_deleted} = false ;;
}
