# Explore: explore_2116
# Auto-generated LookML Explore File

include: "/views/domain_49/view_06349.view.lkml"
include: "/views/domain_01/view_06351.view.lkml"
include: "/views/domain_02/view_06352.view.lkml"
include: "/views/domain_03/view_06353.view.lkml"

explore: explore_2116 {
  label: "Explore Explore 2116"
  description: "Comprehensive analytics explore joining base view_06349 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06349
  
  always_filter: {
    filters: [view_06349.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06349.created_at_date: "7 days"]
    unless: [view_06349.id, view_06349.status]
  }

  join: view_06351 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06349.user_id} = ${view_06351.id} ;;
    required_joins: []
  }

  join: view_06352 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06349.account_id} = ${view_06352.account_id} ;;
    required_joins: [view_06351]
  }

  join: view_06353 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06349.category} = ${view_06353.category} ;;
  }

  access_filter: {
    field: view_06349.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06349.is_deleted} = false ;;
}
