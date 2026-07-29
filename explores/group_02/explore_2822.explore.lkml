# Explore: explore_2822
# Auto-generated LookML Explore File

include: "/views/domain_17/view_08467.view.lkml"
include: "/views/domain_19/view_08469.view.lkml"
include: "/views/domain_20/view_08470.view.lkml"
include: "/views/domain_21/view_08471.view.lkml"

explore: explore_2822 {
  label: "Explore Explore 2822"
  description: "Comprehensive analytics explore joining base view_08467 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08467
  
  always_filter: {
    filters: [view_08467.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08467.created_at_date: "7 days"]
    unless: [view_08467.id, view_08467.status]
  }

  join: view_08469 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08467.user_id} = ${view_08469.id} ;;
    required_joins: []
  }

  join: view_08470 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08467.account_id} = ${view_08470.account_id} ;;
    required_joins: [view_08469]
  }

  join: view_08471 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08467.category} = ${view_08471.category} ;;
  }

  access_filter: {
    field: view_08467.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08467.is_deleted} = false ;;
}
