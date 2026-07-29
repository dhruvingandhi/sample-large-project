# Explore: explore_1936
# Auto-generated LookML Explore File

include: "/views/domain_09/view_05809.view.lkml"
include: "/views/domain_11/view_05811.view.lkml"
include: "/views/domain_12/view_05812.view.lkml"
include: "/views/domain_13/view_05813.view.lkml"

explore: explore_1936 {
  label: "Explore Explore 1936"
  description: "Comprehensive analytics explore joining base view_05809 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05809
  
  always_filter: {
    filters: [view_05809.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05809.created_at_date: "7 days"]
    unless: [view_05809.id, view_05809.status]
  }

  join: view_05811 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05809.user_id} = ${view_05811.id} ;;
    required_joins: []
  }

  join: view_05812 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05809.account_id} = ${view_05812.account_id} ;;
    required_joins: [view_05811]
  }

  join: view_05813 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05809.category} = ${view_05813.category} ;;
  }

  access_filter: {
    field: view_05809.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05809.is_deleted} = false ;;
}
