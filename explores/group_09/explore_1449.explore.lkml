# Explore: explore_1449
# Auto-generated LookML Explore File

include: "/views/domain_48/view_04348.view.lkml"
include: "/views/domain_50/view_04350.view.lkml"
include: "/views/domain_01/view_04351.view.lkml"
include: "/views/domain_02/view_04352.view.lkml"

explore: explore_1449 {
  label: "Explore Explore 1449"
  description: "Comprehensive analytics explore joining base view_04348 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04348
  
  always_filter: {
    filters: [view_04348.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04348.created_at_date: "7 days"]
    unless: [view_04348.id, view_04348.status]
  }

  join: view_04350 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04348.user_id} = ${view_04350.id} ;;
    required_joins: []
  }

  join: view_04351 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04348.account_id} = ${view_04351.account_id} ;;
    required_joins: [view_04350]
  }

  join: view_04352 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04348.category} = ${view_04352.category} ;;
  }

  access_filter: {
    field: view_04348.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04348.is_deleted} = false ;;
}
