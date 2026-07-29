# Explore: explore_3417
# Auto-generated LookML Explore File

include: "/views/domain_02/view_10252.view.lkml"
include: "/views/domain_04/view_10254.view.lkml"
include: "/views/domain_05/view_10255.view.lkml"
include: "/views/domain_06/view_10256.view.lkml"

explore: explore_3417 {
  label: "Explore Explore 3417"
  description: "Comprehensive analytics explore joining base view_10252 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10252
  
  always_filter: {
    filters: [view_10252.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10252.created_at_date: "7 days"]
    unless: [view_10252.id, view_10252.status]
  }

  join: view_10254 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10252.user_id} = ${view_10254.id} ;;
    required_joins: []
  }

  join: view_10255 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10252.account_id} = ${view_10255.account_id} ;;
    required_joins: [view_10254]
  }

  join: view_10256 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10252.category} = ${view_10256.category} ;;
  }

  access_filter: {
    field: view_10252.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10252.is_deleted} = false ;;
}
