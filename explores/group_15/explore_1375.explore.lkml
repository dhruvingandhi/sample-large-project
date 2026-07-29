# Explore: explore_1375
# Auto-generated LookML Explore File

include: "/views/domain_26/view_04126.view.lkml"
include: "/views/domain_28/view_04128.view.lkml"
include: "/views/domain_29/view_04129.view.lkml"
include: "/views/domain_30/view_04130.view.lkml"

explore: explore_1375 {
  label: "Explore Explore 1375"
  description: "Comprehensive analytics explore joining base view_04126 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04126
  
  always_filter: {
    filters: [view_04126.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04126.created_at_date: "7 days"]
    unless: [view_04126.id, view_04126.status]
  }

  join: view_04128 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04126.user_id} = ${view_04128.id} ;;
    required_joins: []
  }

  join: view_04129 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04126.account_id} = ${view_04129.account_id} ;;
    required_joins: [view_04128]
  }

  join: view_04130 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04126.category} = ${view_04130.category} ;;
  }

  access_filter: {
    field: view_04126.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04126.is_deleted} = false ;;
}
