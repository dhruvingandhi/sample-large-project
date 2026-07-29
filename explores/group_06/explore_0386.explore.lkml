# Explore: explore_0386
# Auto-generated LookML Explore File

include: "/views/domain_09/view_01159.view.lkml"
include: "/views/domain_11/view_01161.view.lkml"
include: "/views/domain_12/view_01162.view.lkml"
include: "/views/domain_13/view_01163.view.lkml"

explore: explore_0386 {
  label: "Explore Explore 0386"
  description: "Comprehensive analytics explore joining base view_01159 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01159
  
  always_filter: {
    filters: [view_01159.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01159.created_at_date: "7 days"]
    unless: [view_01159.id, view_01159.status]
  }

  join: view_01161 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01159.user_id} = ${view_01161.id} ;;
    required_joins: []
  }

  join: view_01162 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01159.account_id} = ${view_01162.account_id} ;;
    required_joins: [view_01161]
  }

  join: view_01163 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01159.category} = ${view_01163.category} ;;
  }

  access_filter: {
    field: view_01159.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01159.is_deleted} = false ;;
}
