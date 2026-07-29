# Explore: explore_1453
# Auto-generated LookML Explore File

include: "/views/domain_10/view_04360.view.lkml"
include: "/views/domain_12/view_04362.view.lkml"
include: "/views/domain_13/view_04363.view.lkml"
include: "/views/domain_14/view_04364.view.lkml"

explore: explore_1453 {
  label: "Explore Explore 1453"
  description: "Comprehensive analytics explore joining base view_04360 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04360
  
  always_filter: {
    filters: [view_04360.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04360.created_at_date: "7 days"]
    unless: [view_04360.id, view_04360.status]
  }

  join: view_04362 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04360.user_id} = ${view_04362.id} ;;
    required_joins: []
  }

  join: view_04363 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04360.account_id} = ${view_04363.account_id} ;;
    required_joins: [view_04362]
  }

  join: view_04364 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04360.category} = ${view_04364.category} ;;
  }

  access_filter: {
    field: view_04360.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04360.is_deleted} = false ;;
}
