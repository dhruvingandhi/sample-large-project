# Explore: explore_1487
# Auto-generated LookML Explore File

include: "/views/domain_12/view_04462.view.lkml"
include: "/views/domain_14/view_04464.view.lkml"
include: "/views/domain_15/view_04465.view.lkml"
include: "/views/domain_16/view_04466.view.lkml"

explore: explore_1487 {
  label: "Explore Explore 1487"
  description: "Comprehensive analytics explore joining base view_04462 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04462
  
  always_filter: {
    filters: [view_04462.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04462.created_at_date: "7 days"]
    unless: [view_04462.id, view_04462.status]
  }

  join: view_04464 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04462.user_id} = ${view_04464.id} ;;
    required_joins: []
  }

  join: view_04465 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04462.account_id} = ${view_04465.account_id} ;;
    required_joins: [view_04464]
  }

  join: view_04466 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04462.category} = ${view_04466.category} ;;
  }

  access_filter: {
    field: view_04462.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04462.is_deleted} = false ;;
}
