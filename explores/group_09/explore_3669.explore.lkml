# Explore: explore_3669
# Auto-generated LookML Explore File

include: "/views/domain_08/view_11008.view.lkml"
include: "/views/domain_10/view_11010.view.lkml"
include: "/views/domain_11/view_11011.view.lkml"
include: "/views/domain_12/view_11012.view.lkml"

explore: explore_3669 {
  label: "Explore Explore 3669"
  description: "Comprehensive analytics explore joining base view_11008 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11008
  
  always_filter: {
    filters: [view_11008.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11008.created_at_date: "7 days"]
    unless: [view_11008.id, view_11008.status]
  }

  join: view_11010 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11008.user_id} = ${view_11010.id} ;;
    required_joins: []
  }

  join: view_11011 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11008.account_id} = ${view_11011.account_id} ;;
    required_joins: [view_11010]
  }

  join: view_11012 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11008.category} = ${view_11012.category} ;;
  }

  access_filter: {
    field: view_11008.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11008.is_deleted} = false ;;
}
