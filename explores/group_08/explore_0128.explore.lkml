# Explore: explore_0128
# Auto-generated LookML Explore File

include: "/views/domain_35/view_00385.view.lkml"
include: "/views/domain_37/view_00387.view.lkml"
include: "/views/domain_38/view_00388.view.lkml"
include: "/views/domain_39/view_00389.view.lkml"

explore: explore_0128 {
  label: "Explore Explore 0128"
  description: "Comprehensive analytics explore joining base view_00385 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00385
  
  always_filter: {
    filters: [view_00385.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00385.created_at_date: "7 days"]
    unless: [view_00385.id, view_00385.status]
  }

  join: view_00387 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00385.user_id} = ${view_00387.id} ;;
    required_joins: []
  }

  join: view_00388 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00385.account_id} = ${view_00388.account_id} ;;
    required_joins: [view_00387]
  }

  join: view_00389 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00385.category} = ${view_00389.category} ;;
  }

  access_filter: {
    field: view_00385.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00385.is_deleted} = false ;;
}
