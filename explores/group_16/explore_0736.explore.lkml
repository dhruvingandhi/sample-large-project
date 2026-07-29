# Explore: explore_0736
# Auto-generated LookML Explore File

include: "/views/domain_09/view_02209.view.lkml"
include: "/views/domain_11/view_02211.view.lkml"
include: "/views/domain_12/view_02212.view.lkml"
include: "/views/domain_13/view_02213.view.lkml"

explore: explore_0736 {
  label: "Explore Explore 0736"
  description: "Comprehensive analytics explore joining base view_02209 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02209
  
  always_filter: {
    filters: [view_02209.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02209.created_at_date: "7 days"]
    unless: [view_02209.id, view_02209.status]
  }

  join: view_02211 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02209.user_id} = ${view_02211.id} ;;
    required_joins: []
  }

  join: view_02212 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02209.account_id} = ${view_02212.account_id} ;;
    required_joins: [view_02211]
  }

  join: view_02213 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02209.category} = ${view_02213.category} ;;
  }

  access_filter: {
    field: view_02209.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02209.is_deleted} = false ;;
}
