# Explore: explore_3886
# Auto-generated LookML Explore File

include: "/views/domain_09/view_11659.view.lkml"
include: "/views/domain_11/view_11661.view.lkml"
include: "/views/domain_12/view_11662.view.lkml"
include: "/views/domain_13/view_11663.view.lkml"

explore: explore_3886 {
  label: "Explore Explore 3886"
  description: "Comprehensive analytics explore joining base view_11659 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11659
  
  always_filter: {
    filters: [view_11659.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11659.created_at_date: "7 days"]
    unless: [view_11659.id, view_11659.status]
  }

  join: view_11661 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11659.user_id} = ${view_11661.id} ;;
    required_joins: []
  }

  join: view_11662 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11659.account_id} = ${view_11662.account_id} ;;
    required_joins: [view_11661]
  }

  join: view_11663 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11659.category} = ${view_11663.category} ;;
  }

  access_filter: {
    field: view_11659.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11659.is_deleted} = false ;;
}
