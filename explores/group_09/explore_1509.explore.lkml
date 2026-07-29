# Explore: explore_1509
# Auto-generated LookML Explore File

include: "/views/domain_28/view_04528.view.lkml"
include: "/views/domain_30/view_04530.view.lkml"
include: "/views/domain_31/view_04531.view.lkml"
include: "/views/domain_32/view_04532.view.lkml"

explore: explore_1509 {
  label: "Explore Explore 1509"
  description: "Comprehensive analytics explore joining base view_04528 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04528
  
  always_filter: {
    filters: [view_04528.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04528.created_at_date: "7 days"]
    unless: [view_04528.id, view_04528.status]
  }

  join: view_04530 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04528.user_id} = ${view_04530.id} ;;
    required_joins: []
  }

  join: view_04531 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04528.account_id} = ${view_04531.account_id} ;;
    required_joins: [view_04530]
  }

  join: view_04532 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04528.category} = ${view_04532.category} ;;
  }

  access_filter: {
    field: view_04528.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04528.is_deleted} = false ;;
}
