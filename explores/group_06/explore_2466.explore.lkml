# Explore: explore_2466
# Auto-generated LookML Explore File

include: "/views/domain_49/view_07399.view.lkml"
include: "/views/domain_01/view_07401.view.lkml"
include: "/views/domain_02/view_07402.view.lkml"
include: "/views/domain_03/view_07403.view.lkml"

explore: explore_2466 {
  label: "Explore Explore 2466"
  description: "Comprehensive analytics explore joining base view_07399 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07399
  
  always_filter: {
    filters: [view_07399.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07399.created_at_date: "7 days"]
    unless: [view_07399.id, view_07399.status]
  }

  join: view_07401 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07399.user_id} = ${view_07401.id} ;;
    required_joins: []
  }

  join: view_07402 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07399.account_id} = ${view_07402.account_id} ;;
    required_joins: [view_07401]
  }

  join: view_07403 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07399.category} = ${view_07403.category} ;;
  }

  access_filter: {
    field: view_07399.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07399.is_deleted} = false ;;
}
