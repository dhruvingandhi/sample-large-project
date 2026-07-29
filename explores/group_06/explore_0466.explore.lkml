# Explore: explore_0466
# Auto-generated LookML Explore File

include: "/views/domain_49/view_01399.view.lkml"
include: "/views/domain_01/view_01401.view.lkml"
include: "/views/domain_02/view_01402.view.lkml"
include: "/views/domain_03/view_01403.view.lkml"

explore: explore_0466 {
  label: "Explore Explore 0466"
  description: "Comprehensive analytics explore joining base view_01399 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01399
  
  always_filter: {
    filters: [view_01399.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01399.created_at_date: "7 days"]
    unless: [view_01399.id, view_01399.status]
  }

  join: view_01401 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01399.user_id} = ${view_01401.id} ;;
    required_joins: []
  }

  join: view_01402 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01399.account_id} = ${view_01402.account_id} ;;
    required_joins: [view_01401]
  }

  join: view_01403 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01399.category} = ${view_01403.category} ;;
  }

  access_filter: {
    field: view_01399.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01399.is_deleted} = false ;;
}
