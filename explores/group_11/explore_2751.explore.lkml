# Explore: explore_2751
# Auto-generated LookML Explore File

include: "/views/domain_04/view_08254.view.lkml"
include: "/views/domain_06/view_08256.view.lkml"
include: "/views/domain_07/view_08257.view.lkml"
include: "/views/domain_08/view_08258.view.lkml"

explore: explore_2751 {
  label: "Explore Explore 2751"
  description: "Comprehensive analytics explore joining base view_08254 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08254
  
  always_filter: {
    filters: [view_08254.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08254.created_at_date: "7 days"]
    unless: [view_08254.id, view_08254.status]
  }

  join: view_08256 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08254.user_id} = ${view_08256.id} ;;
    required_joins: []
  }

  join: view_08257 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08254.account_id} = ${view_08257.account_id} ;;
    required_joins: [view_08256]
  }

  join: view_08258 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08254.category} = ${view_08258.category} ;;
  }

  access_filter: {
    field: view_08254.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08254.is_deleted} = false ;;
}
