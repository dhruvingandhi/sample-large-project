# Update for 2000 file diff target
# Explore: explore_0920
# Auto-generated LookML Explore File

include: "/views/domain_11/view_02761.view.lkml"
include: "/views/domain_13/view_02763.view.lkml"
include: "/views/domain_14/view_02764.view.lkml"
include: "/views/domain_15/view_02765.view.lkml"

explore: explore_0920 {
  label: "Explore Explore 0920"
  description: "Comprehensive analytics explore joining base view_02761 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02761
  
  always_filter: {
    filters: [view_02761.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02761.created_at_date: "7 days"]
    unless: [view_02761.id, view_02761.status]
  }

  join: view_02763 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02761.user_id} = ${view_02763.id} ;;
    required_joins: []
  }

  join: view_02764 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02761.account_id} = ${view_02764.account_id} ;;
    required_joins: [view_02763]
  }

  join: view_02765 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02761.category} = ${view_02765.category} ;;
  }

  access_filter: {
    field: view_02761.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02761.is_deleted} = false ;;
}
