# Explore: explore_3552
# Auto-generated LookML Explore File

include: "/views/domain_07/view_10657.view.lkml"
include: "/views/domain_09/view_10659.view.lkml"
include: "/views/domain_10/view_10660.view.lkml"
include: "/views/domain_11/view_10661.view.lkml"

explore: explore_3552 {
  label: "Explore Explore 3552"
  description: "Comprehensive analytics explore joining base view_10657 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10657
  
  always_filter: {
    filters: [view_10657.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10657.created_at_date: "7 days"]
    unless: [view_10657.id, view_10657.status]
  }

  join: view_10659 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10657.user_id} = ${view_10659.id} ;;
    required_joins: []
  }

  join: view_10660 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10657.account_id} = ${view_10660.account_id} ;;
    required_joins: [view_10659]
  }

  join: view_10661 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10657.category} = ${view_10661.category} ;;
  }

  access_filter: {
    field: view_10657.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10657.is_deleted} = false ;;
}
