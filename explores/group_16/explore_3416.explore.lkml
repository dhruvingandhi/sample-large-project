# Explore: explore_3416
# Auto-generated LookML Explore File

include: "/views/domain_49/view_10249.view.lkml"
include: "/views/domain_01/view_10251.view.lkml"
include: "/views/domain_02/view_10252.view.lkml"
include: "/views/domain_03/view_10253.view.lkml"

explore: explore_3416 {
  label: "Explore Explore 3416"
  description: "Comprehensive analytics explore joining base view_10249 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10249
  
  always_filter: {
    filters: [view_10249.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10249.created_at_date: "7 days"]
    unless: [view_10249.id, view_10249.status]
  }

  join: view_10251 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10249.user_id} = ${view_10251.id} ;;
    required_joins: []
  }

  join: view_10252 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10249.account_id} = ${view_10252.account_id} ;;
    required_joins: [view_10251]
  }

  join: view_10253 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10249.category} = ${view_10253.category} ;;
  }

  access_filter: {
    field: view_10249.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10249.is_deleted} = false ;;
}
