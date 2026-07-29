# Explore: explore_2744
# Auto-generated LookML Explore File

include: "/views/domain_33/view_08233.view.lkml"
include: "/views/domain_35/view_08235.view.lkml"
include: "/views/domain_36/view_08236.view.lkml"
include: "/views/domain_37/view_08237.view.lkml"

explore: explore_2744 {
  label: "Explore Explore 2744"
  description: "Comprehensive analytics explore joining base view_08233 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08233
  
  always_filter: {
    filters: [view_08233.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08233.created_at_date: "7 days"]
    unless: [view_08233.id, view_08233.status]
  }

  join: view_08235 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08233.user_id} = ${view_08235.id} ;;
    required_joins: []
  }

  join: view_08236 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08233.account_id} = ${view_08236.account_id} ;;
    required_joins: [view_08235]
  }

  join: view_08237 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08233.category} = ${view_08237.category} ;;
  }

  access_filter: {
    field: view_08233.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08233.is_deleted} = false ;;
}
