# Explore: explore_3018
# Auto-generated LookML Explore File

include: "/views/domain_05/view_09055.view.lkml"
include: "/views/domain_07/view_09057.view.lkml"
include: "/views/domain_08/view_09058.view.lkml"
include: "/views/domain_09/view_09059.view.lkml"

explore: explore_3018 {
  label: "Explore Explore 3018"
  description: "Comprehensive analytics explore joining base view_09055 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09055
  
  always_filter: {
    filters: [view_09055.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09055.created_at_date: "7 days"]
    unless: [view_09055.id, view_09055.status]
  }

  join: view_09057 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09055.user_id} = ${view_09057.id} ;;
    required_joins: []
  }

  join: view_09058 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09055.account_id} = ${view_09058.account_id} ;;
    required_joins: [view_09057]
  }

  join: view_09059 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09055.category} = ${view_09059.category} ;;
  }

  access_filter: {
    field: view_09055.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09055.is_deleted} = false ;;
}
