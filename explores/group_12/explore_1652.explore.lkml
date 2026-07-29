# Explore: explore_1652
# Auto-generated LookML Explore File

include: "/views/domain_07/view_04957.view.lkml"
include: "/views/domain_09/view_04959.view.lkml"
include: "/views/domain_10/view_04960.view.lkml"
include: "/views/domain_11/view_04961.view.lkml"

explore: explore_1652 {
  label: "Explore Explore 1652"
  description: "Comprehensive analytics explore joining base view_04957 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04957
  
  always_filter: {
    filters: [view_04957.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04957.created_at_date: "7 days"]
    unless: [view_04957.id, view_04957.status]
  }

  join: view_04959 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04957.user_id} = ${view_04959.id} ;;
    required_joins: []
  }

  join: view_04960 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04957.account_id} = ${view_04960.account_id} ;;
    required_joins: [view_04959]
  }

  join: view_04961 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04957.category} = ${view_04961.category} ;;
  }

  access_filter: {
    field: view_04957.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04957.is_deleted} = false ;;
}
