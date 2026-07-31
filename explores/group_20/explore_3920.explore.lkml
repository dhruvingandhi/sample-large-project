# Update for 2000 file diff target
# Explore: explore_3920
# Auto-generated LookML Explore File

include: "/views/domain_11/view_11761.view.lkml"
include: "/views/domain_13/view_11763.view.lkml"
include: "/views/domain_14/view_11764.view.lkml"
include: "/views/domain_15/view_11765.view.lkml"

explore: explore_3920 {
  label: "Explore Explore 3920"
  description: "Comprehensive analytics explore joining base view_11761 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11761
  
  always_filter: {
    filters: [view_11761.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11761.created_at_date: "7 days"]
    unless: [view_11761.id, view_11761.status]
  }

  join: view_11763 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11761.user_id} = ${view_11763.id} ;;
    required_joins: []
  }

  join: view_11764 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11761.account_id} = ${view_11764.account_id} ;;
    required_joins: [view_11763]
  }

  join: view_11765 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11761.category} = ${view_11765.category} ;;
  }

  access_filter: {
    field: view_11761.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11761.is_deleted} = false ;;
}
