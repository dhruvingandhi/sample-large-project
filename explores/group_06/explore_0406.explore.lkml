# Explore: explore_0406
# Auto-generated LookML Explore File

include: "/views/domain_19/view_01219.view.lkml"
include: "/views/domain_21/view_01221.view.lkml"
include: "/views/domain_22/view_01222.view.lkml"
include: "/views/domain_23/view_01223.view.lkml"

explore: explore_0406 {
  label: "Explore Explore 0406"
  description: "Comprehensive analytics explore joining base view_01219 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01219
  
  always_filter: {
    filters: [view_01219.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01219.created_at_date: "7 days"]
    unless: [view_01219.id, view_01219.status]
  }

  join: view_01221 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01219.user_id} = ${view_01221.id} ;;
    required_joins: []
  }

  join: view_01222 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01219.account_id} = ${view_01222.account_id} ;;
    required_joins: [view_01221]
  }

  join: view_01223 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01219.category} = ${view_01223.category} ;;
  }

  access_filter: {
    field: view_01219.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01219.is_deleted} = false ;;
}
