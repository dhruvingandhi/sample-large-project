# Explore: explore_1067
# Auto-generated LookML Explore File

include: "/views/domain_02/view_03202.view.lkml"
include: "/views/domain_04/view_03204.view.lkml"
include: "/views/domain_05/view_03205.view.lkml"
include: "/views/domain_06/view_03206.view.lkml"

explore: explore_1067 {
  label: "Explore Explore 1067"
  description: "Comprehensive analytics explore joining base view_03202 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03202
  
  always_filter: {
    filters: [view_03202.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03202.created_at_date: "7 days"]
    unless: [view_03202.id, view_03202.status]
  }

  join: view_03204 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03202.user_id} = ${view_03204.id} ;;
    required_joins: []
  }

  join: view_03205 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03202.account_id} = ${view_03205.account_id} ;;
    required_joins: [view_03204]
  }

  join: view_03206 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03202.category} = ${view_03206.category} ;;
  }

  access_filter: {
    field: view_03202.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03202.is_deleted} = false ;;
}
