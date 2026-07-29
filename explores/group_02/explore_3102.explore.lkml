# Explore: explore_3102
# Auto-generated LookML Explore File

include: "/views/domain_07/view_09307.view.lkml"
include: "/views/domain_09/view_09309.view.lkml"
include: "/views/domain_10/view_09310.view.lkml"
include: "/views/domain_11/view_09311.view.lkml"

explore: explore_3102 {
  label: "Explore Explore 3102"
  description: "Comprehensive analytics explore joining base view_09307 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09307
  
  always_filter: {
    filters: [view_09307.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09307.created_at_date: "7 days"]
    unless: [view_09307.id, view_09307.status]
  }

  join: view_09309 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09307.user_id} = ${view_09309.id} ;;
    required_joins: []
  }

  join: view_09310 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09307.account_id} = ${view_09310.account_id} ;;
    required_joins: [view_09309]
  }

  join: view_09311 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09307.category} = ${view_09311.category} ;;
  }

  access_filter: {
    field: view_09307.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09307.is_deleted} = false ;;
}
