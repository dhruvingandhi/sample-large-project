# Explore: explore_2117
# Auto-generated LookML Explore File

include: "/views/domain_02/view_06352.view.lkml"
include: "/views/domain_04/view_06354.view.lkml"
include: "/views/domain_05/view_06355.view.lkml"
include: "/views/domain_06/view_06356.view.lkml"

explore: explore_2117 {
  label: "Explore Explore 2117"
  description: "Comprehensive analytics explore joining base view_06352 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06352
  
  always_filter: {
    filters: [view_06352.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06352.created_at_date: "7 days"]
    unless: [view_06352.id, view_06352.status]
  }

  join: view_06354 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06352.user_id} = ${view_06354.id} ;;
    required_joins: []
  }

  join: view_06355 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06352.account_id} = ${view_06355.account_id} ;;
    required_joins: [view_06354]
  }

  join: view_06356 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06352.category} = ${view_06356.category} ;;
  }

  access_filter: {
    field: view_06352.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06352.is_deleted} = false ;;
}
