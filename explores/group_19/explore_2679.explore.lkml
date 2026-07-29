# Explore: explore_2679
# Auto-generated LookML Explore File

include: "/views/domain_38/view_08038.view.lkml"
include: "/views/domain_40/view_08040.view.lkml"
include: "/views/domain_41/view_08041.view.lkml"
include: "/views/domain_42/view_08042.view.lkml"

explore: explore_2679 {
  label: "Explore Explore 2679"
  description: "Comprehensive analytics explore joining base view_08038 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08038
  
  always_filter: {
    filters: [view_08038.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08038.created_at_date: "7 days"]
    unless: [view_08038.id, view_08038.status]
  }

  join: view_08040 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08038.user_id} = ${view_08040.id} ;;
    required_joins: []
  }

  join: view_08041 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08038.account_id} = ${view_08041.account_id} ;;
    required_joins: [view_08040]
  }

  join: view_08042 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08038.category} = ${view_08042.category} ;;
  }

  access_filter: {
    field: view_08038.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08038.is_deleted} = false ;;
}
