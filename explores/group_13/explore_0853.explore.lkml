# Explore: explore_0853
# Auto-generated LookML Explore File

include: "/views/domain_10/view_02560.view.lkml"
include: "/views/domain_12/view_02562.view.lkml"
include: "/views/domain_13/view_02563.view.lkml"
include: "/views/domain_14/view_02564.view.lkml"

explore: explore_0853 {
  label: "Explore Explore 0853"
  description: "Comprehensive analytics explore joining base view_02560 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02560
  
  always_filter: {
    filters: [view_02560.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02560.created_at_date: "7 days"]
    unless: [view_02560.id, view_02560.status]
  }

  join: view_02562 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02560.user_id} = ${view_02562.id} ;;
    required_joins: []
  }

  join: view_02563 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02560.account_id} = ${view_02563.account_id} ;;
    required_joins: [view_02562]
  }

  join: view_02564 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02560.category} = ${view_02564.category} ;;
  }

  access_filter: {
    field: view_02560.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02560.is_deleted} = false ;;
}
