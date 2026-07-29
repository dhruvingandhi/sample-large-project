# Explore: explore_0541
# Auto-generated LookML Explore File

include: "/views/domain_24/view_01624.view.lkml"
include: "/views/domain_26/view_01626.view.lkml"
include: "/views/domain_27/view_01627.view.lkml"
include: "/views/domain_28/view_01628.view.lkml"

explore: explore_0541 {
  label: "Explore Explore 0541"
  description: "Comprehensive analytics explore joining base view_01624 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01624
  
  always_filter: {
    filters: [view_01624.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01624.created_at_date: "7 days"]
    unless: [view_01624.id, view_01624.status]
  }

  join: view_01626 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01624.user_id} = ${view_01626.id} ;;
    required_joins: []
  }

  join: view_01627 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01624.account_id} = ${view_01627.account_id} ;;
    required_joins: [view_01626]
  }

  join: view_01628 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01624.category} = ${view_01628.category} ;;
  }

  access_filter: {
    field: view_01624.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01624.is_deleted} = false ;;
}
