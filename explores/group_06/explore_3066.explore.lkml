# Explore: explore_3066
# Auto-generated LookML Explore File

include: "/views/domain_49/view_09199.view.lkml"
include: "/views/domain_01/view_09201.view.lkml"
include: "/views/domain_02/view_09202.view.lkml"
include: "/views/domain_03/view_09203.view.lkml"

explore: explore_3066 {
  label: "Explore Explore 3066"
  description: "Comprehensive analytics explore joining base view_09199 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09199
  
  always_filter: {
    filters: [view_09199.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09199.created_at_date: "7 days"]
    unless: [view_09199.id, view_09199.status]
  }

  join: view_09201 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09199.user_id} = ${view_09201.id} ;;
    required_joins: []
  }

  join: view_09202 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09199.account_id} = ${view_09202.account_id} ;;
    required_joins: [view_09201]
  }

  join: view_09203 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09199.category} = ${view_09203.category} ;;
  }

  access_filter: {
    field: view_09199.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09199.is_deleted} = false ;;
}
