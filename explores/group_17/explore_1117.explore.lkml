# Explore: explore_1117
# Auto-generated LookML Explore File

include: "/views/domain_02/view_03352.view.lkml"
include: "/views/domain_04/view_03354.view.lkml"
include: "/views/domain_05/view_03355.view.lkml"
include: "/views/domain_06/view_03356.view.lkml"

explore: explore_1117 {
  label: "Explore Explore 1117"
  description: "Comprehensive analytics explore joining base view_03352 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03352
  
  always_filter: {
    filters: [view_03352.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03352.created_at_date: "7 days"]
    unless: [view_03352.id, view_03352.status]
  }

  join: view_03354 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03352.user_id} = ${view_03354.id} ;;
    required_joins: []
  }

  join: view_03355 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03352.account_id} = ${view_03355.account_id} ;;
    required_joins: [view_03354]
  }

  join: view_03356 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03352.category} = ${view_03356.category} ;;
  }

  access_filter: {
    field: view_03352.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03352.is_deleted} = false ;;
}
