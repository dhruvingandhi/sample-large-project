# Explore: explore_3325
# Auto-generated LookML Explore File

include: "/views/domain_26/view_09976.view.lkml"
include: "/views/domain_28/view_09978.view.lkml"
include: "/views/domain_29/view_09979.view.lkml"
include: "/views/domain_30/view_09980.view.lkml"

explore: explore_3325 {
  label: "Explore Explore 3325"
  description: "Comprehensive analytics explore joining base view_09976 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09976
  
  always_filter: {
    filters: [view_09976.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09976.created_at_date: "7 days"]
    unless: [view_09976.id, view_09976.status]
  }

  join: view_09978 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09976.user_id} = ${view_09978.id} ;;
    required_joins: []
  }

  join: view_09979 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09976.account_id} = ${view_09979.account_id} ;;
    required_joins: [view_09978]
  }

  join: view_09980 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09976.category} = ${view_09980.category} ;;
  }

  access_filter: {
    field: view_09976.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09976.is_deleted} = false ;;
}
