# Explore: explore_3541
# Auto-generated LookML Explore File

include: "/views/domain_24/view_10624.view.lkml"
include: "/views/domain_26/view_10626.view.lkml"
include: "/views/domain_27/view_10627.view.lkml"
include: "/views/domain_28/view_10628.view.lkml"

explore: explore_3541 {
  label: "Explore Explore 3541"
  description: "Comprehensive analytics explore joining base view_10624 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10624
  
  always_filter: {
    filters: [view_10624.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10624.created_at_date: "7 days"]
    unless: [view_10624.id, view_10624.status]
  }

  join: view_10626 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10624.user_id} = ${view_10626.id} ;;
    required_joins: []
  }

  join: view_10627 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10624.account_id} = ${view_10627.account_id} ;;
    required_joins: [view_10626]
  }

  join: view_10628 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10624.category} = ${view_10628.category} ;;
  }

  access_filter: {
    field: view_10624.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10624.is_deleted} = false ;;
}
