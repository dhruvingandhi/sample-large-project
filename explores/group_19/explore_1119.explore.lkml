# Explore: explore_1119
# Auto-generated LookML Explore File

include: "/views/domain_08/view_03358.view.lkml"
include: "/views/domain_10/view_03360.view.lkml"
include: "/views/domain_11/view_03361.view.lkml"
include: "/views/domain_12/view_03362.view.lkml"

explore: explore_1119 {
  label: "Explore Explore 1119"
  description: "Comprehensive analytics explore joining base view_03358 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03358
  
  always_filter: {
    filters: [view_03358.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03358.created_at_date: "7 days"]
    unless: [view_03358.id, view_03358.status]
  }

  join: view_03360 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03358.user_id} = ${view_03360.id} ;;
    required_joins: []
  }

  join: view_03361 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03358.account_id} = ${view_03361.account_id} ;;
    required_joins: [view_03360]
  }

  join: view_03362 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03358.category} = ${view_03362.category} ;;
  }

  access_filter: {
    field: view_03358.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03358.is_deleted} = false ;;
}
