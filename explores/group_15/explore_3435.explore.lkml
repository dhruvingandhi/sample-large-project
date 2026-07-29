# Explore: explore_3435
# Auto-generated LookML Explore File

include: "/views/domain_06/view_10306.view.lkml"
include: "/views/domain_08/view_10308.view.lkml"
include: "/views/domain_09/view_10309.view.lkml"
include: "/views/domain_10/view_10310.view.lkml"

explore: explore_3435 {
  label: "Explore Explore 3435"
  description: "Comprehensive analytics explore joining base view_10306 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10306
  
  always_filter: {
    filters: [view_10306.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10306.created_at_date: "7 days"]
    unless: [view_10306.id, view_10306.status]
  }

  join: view_10308 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10306.user_id} = ${view_10308.id} ;;
    required_joins: []
  }

  join: view_10309 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10306.account_id} = ${view_10309.account_id} ;;
    required_joins: [view_10308]
  }

  join: view_10310 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10306.category} = ${view_10310.category} ;;
  }

  access_filter: {
    field: view_10306.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10306.is_deleted} = false ;;
}
