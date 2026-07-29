# Explore: explore_2088
# Auto-generated LookML Explore File

include: "/views/domain_15/view_06265.view.lkml"
include: "/views/domain_17/view_06267.view.lkml"
include: "/views/domain_18/view_06268.view.lkml"
include: "/views/domain_19/view_06269.view.lkml"

explore: explore_2088 {
  label: "Explore Explore 2088"
  description: "Comprehensive analytics explore joining base view_06265 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06265
  
  always_filter: {
    filters: [view_06265.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06265.created_at_date: "7 days"]
    unless: [view_06265.id, view_06265.status]
  }

  join: view_06267 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06265.user_id} = ${view_06267.id} ;;
    required_joins: []
  }

  join: view_06268 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06265.account_id} = ${view_06268.account_id} ;;
    required_joins: [view_06267]
  }

  join: view_06269 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06265.category} = ${view_06269.category} ;;
  }

  access_filter: {
    field: view_06265.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06265.is_deleted} = false ;;
}
