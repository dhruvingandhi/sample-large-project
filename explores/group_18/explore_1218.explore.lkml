# Explore: explore_1218
# Auto-generated LookML Explore File

include: "/views/domain_05/view_03655.view.lkml"
include: "/views/domain_07/view_03657.view.lkml"
include: "/views/domain_08/view_03658.view.lkml"
include: "/views/domain_09/view_03659.view.lkml"

explore: explore_1218 {
  label: "Explore Explore 1218"
  description: "Comprehensive analytics explore joining base view_03655 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03655
  
  always_filter: {
    filters: [view_03655.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03655.created_at_date: "7 days"]
    unless: [view_03655.id, view_03655.status]
  }

  join: view_03657 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03655.user_id} = ${view_03657.id} ;;
    required_joins: []
  }

  join: view_03658 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03655.account_id} = ${view_03658.account_id} ;;
    required_joins: [view_03657]
  }

  join: view_03659 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03655.category} = ${view_03659.category} ;;
  }

  access_filter: {
    field: view_03655.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03655.is_deleted} = false ;;
}
