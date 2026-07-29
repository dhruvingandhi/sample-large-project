# Explore: explore_0551
# Auto-generated LookML Explore File

include: "/views/domain_04/view_01654.view.lkml"
include: "/views/domain_06/view_01656.view.lkml"
include: "/views/domain_07/view_01657.view.lkml"
include: "/views/domain_08/view_01658.view.lkml"

explore: explore_0551 {
  label: "Explore Explore 0551"
  description: "Comprehensive analytics explore joining base view_01654 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01654
  
  always_filter: {
    filters: [view_01654.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01654.created_at_date: "7 days"]
    unless: [view_01654.id, view_01654.status]
  }

  join: view_01656 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01654.user_id} = ${view_01656.id} ;;
    required_joins: []
  }

  join: view_01657 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01654.account_id} = ${view_01657.account_id} ;;
    required_joins: [view_01656]
  }

  join: view_01658 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01654.category} = ${view_01658.category} ;;
  }

  access_filter: {
    field: view_01654.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01654.is_deleted} = false ;;
}
