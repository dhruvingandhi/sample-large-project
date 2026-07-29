# Explore: explore_1541
# Auto-generated LookML Explore File

include: "/views/domain_24/view_04624.view.lkml"
include: "/views/domain_26/view_04626.view.lkml"
include: "/views/domain_27/view_04627.view.lkml"
include: "/views/domain_28/view_04628.view.lkml"

explore: explore_1541 {
  label: "Explore Explore 1541"
  description: "Comprehensive analytics explore joining base view_04624 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04624
  
  always_filter: {
    filters: [view_04624.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04624.created_at_date: "7 days"]
    unless: [view_04624.id, view_04624.status]
  }

  join: view_04626 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04624.user_id} = ${view_04626.id} ;;
    required_joins: []
  }

  join: view_04627 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04624.account_id} = ${view_04627.account_id} ;;
    required_joins: [view_04626]
  }

  join: view_04628 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04624.category} = ${view_04628.category} ;;
  }

  access_filter: {
    field: view_04624.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04624.is_deleted} = false ;;
}
