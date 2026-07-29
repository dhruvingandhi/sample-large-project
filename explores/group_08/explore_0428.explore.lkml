# Explore: explore_0428
# Auto-generated LookML Explore File

include: "/views/domain_35/view_01285.view.lkml"
include: "/views/domain_37/view_01287.view.lkml"
include: "/views/domain_38/view_01288.view.lkml"
include: "/views/domain_39/view_01289.view.lkml"

explore: explore_0428 {
  label: "Explore Explore 0428"
  description: "Comprehensive analytics explore joining base view_01285 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01285
  
  always_filter: {
    filters: [view_01285.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01285.created_at_date: "7 days"]
    unless: [view_01285.id, view_01285.status]
  }

  join: view_01287 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01285.user_id} = ${view_01287.id} ;;
    required_joins: []
  }

  join: view_01288 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01285.account_id} = ${view_01288.account_id} ;;
    required_joins: [view_01287]
  }

  join: view_01289 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01285.category} = ${view_01289.category} ;;
  }

  access_filter: {
    field: view_01285.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01285.is_deleted} = false ;;
}
