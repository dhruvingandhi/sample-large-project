# Explore: explore_0218
# Auto-generated LookML Explore File

include: "/views/domain_05/view_00655.view.lkml"
include: "/views/domain_07/view_00657.view.lkml"
include: "/views/domain_08/view_00658.view.lkml"
include: "/views/domain_09/view_00659.view.lkml"

explore: explore_0218 {
  label: "Explore Explore 0218"
  description: "Comprehensive analytics explore joining base view_00655 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00655
  
  always_filter: {
    filters: [view_00655.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00655.created_at_date: "7 days"]
    unless: [view_00655.id, view_00655.status]
  }

  join: view_00657 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00655.user_id} = ${view_00657.id} ;;
    required_joins: []
  }

  join: view_00658 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00655.account_id} = ${view_00658.account_id} ;;
    required_joins: [view_00657]
  }

  join: view_00659 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00655.category} = ${view_00659.category} ;;
  }

  access_filter: {
    field: view_00655.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00655.is_deleted} = false ;;
}
