# Explore: explore_2869
# Auto-generated LookML Explore File

include: "/views/domain_08/view_08608.view.lkml"
include: "/views/domain_10/view_08610.view.lkml"
include: "/views/domain_11/view_08611.view.lkml"
include: "/views/domain_12/view_08612.view.lkml"

explore: explore_2869 {
  label: "Explore Explore 2869"
  description: "Comprehensive analytics explore joining base view_08608 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08608
  
  always_filter: {
    filters: [view_08608.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08608.created_at_date: "7 days"]
    unless: [view_08608.id, view_08608.status]
  }

  join: view_08610 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08608.user_id} = ${view_08610.id} ;;
    required_joins: []
  }

  join: view_08611 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08608.account_id} = ${view_08611.account_id} ;;
    required_joins: [view_08610]
  }

  join: view_08612 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08608.category} = ${view_08612.category} ;;
  }

  access_filter: {
    field: view_08608.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08608.is_deleted} = false ;;
}
