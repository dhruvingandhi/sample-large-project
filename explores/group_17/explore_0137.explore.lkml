# Explore: explore_0137
# Auto-generated LookML Explore File

include: "/views/domain_12/view_00412.view.lkml"
include: "/views/domain_14/view_00414.view.lkml"
include: "/views/domain_15/view_00415.view.lkml"
include: "/views/domain_16/view_00416.view.lkml"

explore: explore_0137 {
  label: "Explore Explore 0137"
  description: "Comprehensive analytics explore joining base view_00412 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00412
  
  always_filter: {
    filters: [view_00412.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00412.created_at_date: "7 days"]
    unless: [view_00412.id, view_00412.status]
  }

  join: view_00414 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00412.user_id} = ${view_00414.id} ;;
    required_joins: []
  }

  join: view_00415 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00412.account_id} = ${view_00415.account_id} ;;
    required_joins: [view_00414]
  }

  join: view_00416 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00412.category} = ${view_00416.category} ;;
  }

  access_filter: {
    field: view_00412.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00412.is_deleted} = false ;;
}
