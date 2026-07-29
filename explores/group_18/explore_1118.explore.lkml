# Explore: explore_1118
# Auto-generated LookML Explore File

include: "/views/domain_05/view_03355.view.lkml"
include: "/views/domain_07/view_03357.view.lkml"
include: "/views/domain_08/view_03358.view.lkml"
include: "/views/domain_09/view_03359.view.lkml"

explore: explore_1118 {
  label: "Explore Explore 1118"
  description: "Comprehensive analytics explore joining base view_03355 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03355
  
  always_filter: {
    filters: [view_03355.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03355.created_at_date: "7 days"]
    unless: [view_03355.id, view_03355.status]
  }

  join: view_03357 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03355.user_id} = ${view_03357.id} ;;
    required_joins: []
  }

  join: view_03358 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03355.account_id} = ${view_03358.account_id} ;;
    required_joins: [view_03357]
  }

  join: view_03359 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03355.category} = ${view_03359.category} ;;
  }

  access_filter: {
    field: view_03355.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03355.is_deleted} = false ;;
}
