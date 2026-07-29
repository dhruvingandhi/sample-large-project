# Explore: explore_3551
# Auto-generated LookML Explore File

include: "/views/domain_04/view_10654.view.lkml"
include: "/views/domain_06/view_10656.view.lkml"
include: "/views/domain_07/view_10657.view.lkml"
include: "/views/domain_08/view_10658.view.lkml"

explore: explore_3551 {
  label: "Explore Explore 3551"
  description: "Comprehensive analytics explore joining base view_10654 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10654
  
  always_filter: {
    filters: [view_10654.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10654.created_at_date: "7 days"]
    unless: [view_10654.id, view_10654.status]
  }

  join: view_10656 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10654.user_id} = ${view_10656.id} ;;
    required_joins: []
  }

  join: view_10657 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10654.account_id} = ${view_10657.account_id} ;;
    required_joins: [view_10656]
  }

  join: view_10658 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10654.category} = ${view_10658.category} ;;
  }

  access_filter: {
    field: view_10654.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10654.is_deleted} = false ;;
}
