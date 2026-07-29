# Explore: explore_1153
# Auto-generated LookML Explore File

include: "/views/domain_10/view_03460.view.lkml"
include: "/views/domain_12/view_03462.view.lkml"
include: "/views/domain_13/view_03463.view.lkml"
include: "/views/domain_14/view_03464.view.lkml"

explore: explore_1153 {
  label: "Explore Explore 1153"
  description: "Comprehensive analytics explore joining base view_03460 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03460
  
  always_filter: {
    filters: [view_03460.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03460.created_at_date: "7 days"]
    unless: [view_03460.id, view_03460.status]
  }

  join: view_03462 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03460.user_id} = ${view_03462.id} ;;
    required_joins: []
  }

  join: view_03463 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03460.account_id} = ${view_03463.account_id} ;;
    required_joins: [view_03462]
  }

  join: view_03464 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03460.category} = ${view_03464.category} ;;
  }

  access_filter: {
    field: view_03460.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03460.is_deleted} = false ;;
}
