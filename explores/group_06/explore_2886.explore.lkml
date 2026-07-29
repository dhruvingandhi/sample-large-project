# Explore: explore_2886
# Auto-generated LookML Explore File

include: "/views/domain_09/view_08659.view.lkml"
include: "/views/domain_11/view_08661.view.lkml"
include: "/views/domain_12/view_08662.view.lkml"
include: "/views/domain_13/view_08663.view.lkml"

explore: explore_2886 {
  label: "Explore Explore 2886"
  description: "Comprehensive analytics explore joining base view_08659 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08659
  
  always_filter: {
    filters: [view_08659.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08659.created_at_date: "7 days"]
    unless: [view_08659.id, view_08659.status]
  }

  join: view_08661 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08659.user_id} = ${view_08661.id} ;;
    required_joins: []
  }

  join: view_08662 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08659.account_id} = ${view_08662.account_id} ;;
    required_joins: [view_08661]
  }

  join: view_08663 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08659.category} = ${view_08663.category} ;;
  }

  access_filter: {
    field: view_08659.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08659.is_deleted} = false ;;
}
