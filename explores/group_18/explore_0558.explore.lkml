# Update for 2000 file diff target
# Explore: explore_0558
# Auto-generated LookML Explore File

include: "/views/domain_25/view_01675.view.lkml"
include: "/views/domain_27/view_01677.view.lkml"
include: "/views/domain_28/view_01678.view.lkml"
include: "/views/domain_29/view_01679.view.lkml"

explore: explore_0558 {
  label: "Explore Explore 0558"
  description: "Comprehensive analytics explore joining base view_01675 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01675
  
  always_filter: {
    filters: [view_01675.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01675.created_at_date: "7 days"]
    unless: [view_01675.id, view_01675.status]
  }

  join: view_01677 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01675.user_id} = ${view_01677.id} ;;
    required_joins: []
  }

  join: view_01678 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01675.account_id} = ${view_01678.account_id} ;;
    required_joins: [view_01677]
  }

  join: view_01679 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01675.category} = ${view_01679.category} ;;
  }

  access_filter: {
    field: view_01675.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01675.is_deleted} = false ;;
}
