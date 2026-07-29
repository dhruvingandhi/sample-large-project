# Explore: explore_2788
# Auto-generated LookML Explore File

include: "/views/domain_15/view_08365.view.lkml"
include: "/views/domain_17/view_08367.view.lkml"
include: "/views/domain_18/view_08368.view.lkml"
include: "/views/domain_19/view_08369.view.lkml"

explore: explore_2788 {
  label: "Explore Explore 2788"
  description: "Comprehensive analytics explore joining base view_08365 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08365
  
  always_filter: {
    filters: [view_08365.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08365.created_at_date: "7 days"]
    unless: [view_08365.id, view_08365.status]
  }

  join: view_08367 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08365.user_id} = ${view_08367.id} ;;
    required_joins: []
  }

  join: view_08368 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08365.account_id} = ${view_08368.account_id} ;;
    required_joins: [view_08367]
  }

  join: view_08369 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08365.category} = ${view_08369.category} ;;
  }

  access_filter: {
    field: view_08365.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08365.is_deleted} = false ;;
}
