# Explore: explore_2066
# Auto-generated LookML Explore File

include: "/views/domain_49/view_06199.view.lkml"
include: "/views/domain_01/view_06201.view.lkml"
include: "/views/domain_02/view_06202.view.lkml"
include: "/views/domain_03/view_06203.view.lkml"

explore: explore_2066 {
  label: "Explore Explore 2066"
  description: "Comprehensive analytics explore joining base view_06199 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06199
  
  always_filter: {
    filters: [view_06199.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06199.created_at_date: "7 days"]
    unless: [view_06199.id, view_06199.status]
  }

  join: view_06201 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06199.user_id} = ${view_06201.id} ;;
    required_joins: []
  }

  join: view_06202 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06199.account_id} = ${view_06202.account_id} ;;
    required_joins: [view_06201]
  }

  join: view_06203 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06199.category} = ${view_06203.category} ;;
  }

  access_filter: {
    field: view_06199.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06199.is_deleted} = false ;;
}
