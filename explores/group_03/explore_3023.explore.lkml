# Explore: explore_3023
# Auto-generated LookML Explore File

include: "/views/domain_20/view_09070.view.lkml"
include: "/views/domain_22/view_09072.view.lkml"
include: "/views/domain_23/view_09073.view.lkml"
include: "/views/domain_24/view_09074.view.lkml"

explore: explore_3023 {
  label: "Explore Explore 3023"
  description: "Comprehensive analytics explore joining base view_09070 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09070
  
  always_filter: {
    filters: [view_09070.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09070.created_at_date: "7 days"]
    unless: [view_09070.id, view_09070.status]
  }

  join: view_09072 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09070.user_id} = ${view_09072.id} ;;
    required_joins: []
  }

  join: view_09073 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09070.account_id} = ${view_09073.account_id} ;;
    required_joins: [view_09072]
  }

  join: view_09074 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09070.category} = ${view_09074.category} ;;
  }

  access_filter: {
    field: view_09070.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09070.is_deleted} = false ;;
}
