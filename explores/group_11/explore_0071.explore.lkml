# Explore: explore_0071
# Auto-generated LookML Explore File

include: "/views/domain_14/view_00214.view.lkml"
include: "/views/domain_16/view_00216.view.lkml"
include: "/views/domain_17/view_00217.view.lkml"
include: "/views/domain_18/view_00218.view.lkml"

explore: explore_0071 {
  label: "Explore Explore 0071"
  description: "Comprehensive analytics explore joining base view_00214 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00214
  
  always_filter: {
    filters: [view_00214.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00214.created_at_date: "7 days"]
    unless: [view_00214.id, view_00214.status]
  }

  join: view_00216 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00214.user_id} = ${view_00216.id} ;;
    required_joins: []
  }

  join: view_00217 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00214.account_id} = ${view_00217.account_id} ;;
    required_joins: [view_00216]
  }

  join: view_00218 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00214.category} = ${view_00218.category} ;;
  }

  access_filter: {
    field: view_00214.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00214.is_deleted} = false ;;
}
