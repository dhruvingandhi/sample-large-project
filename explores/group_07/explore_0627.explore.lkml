# Explore: explore_0627
# Auto-generated LookML Explore File

include: "/views/domain_32/view_01882.view.lkml"
include: "/views/domain_34/view_01884.view.lkml"
include: "/views/domain_35/view_01885.view.lkml"
include: "/views/domain_36/view_01886.view.lkml"

explore: explore_0627 {
  label: "Explore Explore 0627"
  description: "Comprehensive analytics explore joining base view_01882 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01882
  
  always_filter: {
    filters: [view_01882.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01882.created_at_date: "7 days"]
    unless: [view_01882.id, view_01882.status]
  }

  join: view_01884 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01882.user_id} = ${view_01884.id} ;;
    required_joins: []
  }

  join: view_01885 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01882.account_id} = ${view_01885.account_id} ;;
    required_joins: [view_01884]
  }

  join: view_01886 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01882.category} = ${view_01886.category} ;;
  }

  access_filter: {
    field: view_01882.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01882.is_deleted} = false ;;
}
