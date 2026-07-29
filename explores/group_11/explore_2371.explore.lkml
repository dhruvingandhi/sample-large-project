# Explore: explore_2371
# Auto-generated LookML Explore File

include: "/views/domain_14/view_07114.view.lkml"
include: "/views/domain_16/view_07116.view.lkml"
include: "/views/domain_17/view_07117.view.lkml"
include: "/views/domain_18/view_07118.view.lkml"

explore: explore_2371 {
  label: "Explore Explore 2371"
  description: "Comprehensive analytics explore joining base view_07114 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07114
  
  always_filter: {
    filters: [view_07114.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07114.created_at_date: "7 days"]
    unless: [view_07114.id, view_07114.status]
  }

  join: view_07116 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07114.user_id} = ${view_07116.id} ;;
    required_joins: []
  }

  join: view_07117 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07114.account_id} = ${view_07117.account_id} ;;
    required_joins: [view_07116]
  }

  join: view_07118 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07114.category} = ${view_07118.category} ;;
  }

  access_filter: {
    field: view_07114.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07114.is_deleted} = false ;;
}
