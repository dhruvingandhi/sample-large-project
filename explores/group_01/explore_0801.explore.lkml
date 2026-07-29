# Explore: explore_0801
# Auto-generated LookML Explore File

include: "/views/domain_04/view_02404.view.lkml"
include: "/views/domain_06/view_02406.view.lkml"
include: "/views/domain_07/view_02407.view.lkml"
include: "/views/domain_08/view_02408.view.lkml"

explore: explore_0801 {
  label: "Explore Explore 0801"
  description: "Comprehensive analytics explore joining base view_02404 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02404
  
  always_filter: {
    filters: [view_02404.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02404.created_at_date: "7 days"]
    unless: [view_02404.id, view_02404.status]
  }

  join: view_02406 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02404.user_id} = ${view_02406.id} ;;
    required_joins: []
  }

  join: view_02407 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02404.account_id} = ${view_02407.account_id} ;;
    required_joins: [view_02406]
  }

  join: view_02408 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02404.category} = ${view_02408.category} ;;
  }

  access_filter: {
    field: view_02404.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02404.is_deleted} = false ;;
}
