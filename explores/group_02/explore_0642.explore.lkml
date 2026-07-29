# Explore: explore_0642
# Auto-generated LookML Explore File

include: "/views/domain_27/view_01927.view.lkml"
include: "/views/domain_29/view_01929.view.lkml"
include: "/views/domain_30/view_01930.view.lkml"
include: "/views/domain_31/view_01931.view.lkml"

explore: explore_0642 {
  label: "Explore Explore 0642"
  description: "Comprehensive analytics explore joining base view_01927 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01927
  
  always_filter: {
    filters: [view_01927.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01927.created_at_date: "7 days"]
    unless: [view_01927.id, view_01927.status]
  }

  join: view_01929 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01927.user_id} = ${view_01929.id} ;;
    required_joins: []
  }

  join: view_01930 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01927.account_id} = ${view_01930.account_id} ;;
    required_joins: [view_01929]
  }

  join: view_01931 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01927.category} = ${view_01931.category} ;;
  }

  access_filter: {
    field: view_01927.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01927.is_deleted} = false ;;
}
