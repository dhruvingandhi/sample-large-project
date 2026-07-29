# Explore: explore_2802
# Auto-generated LookML Explore File

include: "/views/domain_07/view_08407.view.lkml"
include: "/views/domain_09/view_08409.view.lkml"
include: "/views/domain_10/view_08410.view.lkml"
include: "/views/domain_11/view_08411.view.lkml"

explore: explore_2802 {
  label: "Explore Explore 2802"
  description: "Comprehensive analytics explore joining base view_08407 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08407
  
  always_filter: {
    filters: [view_08407.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08407.created_at_date: "7 days"]
    unless: [view_08407.id, view_08407.status]
  }

  join: view_08409 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08407.user_id} = ${view_08409.id} ;;
    required_joins: []
  }

  join: view_08410 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08407.account_id} = ${view_08410.account_id} ;;
    required_joins: [view_08409]
  }

  join: view_08411 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08407.category} = ${view_08411.category} ;;
  }

  access_filter: {
    field: view_08407.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08407.is_deleted} = false ;;
}
