# Explore: explore_2343
# Auto-generated LookML Explore File

include: "/views/domain_30/view_07030.view.lkml"
include: "/views/domain_32/view_07032.view.lkml"
include: "/views/domain_33/view_07033.view.lkml"
include: "/views/domain_34/view_07034.view.lkml"

explore: explore_2343 {
  label: "Explore Explore 2343"
  description: "Comprehensive analytics explore joining base view_07030 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07030
  
  always_filter: {
    filters: [view_07030.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07030.created_at_date: "7 days"]
    unless: [view_07030.id, view_07030.status]
  }

  join: view_07032 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07030.user_id} = ${view_07032.id} ;;
    required_joins: []
  }

  join: view_07033 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07030.account_id} = ${view_07033.account_id} ;;
    required_joins: [view_07032]
  }

  join: view_07034 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07030.category} = ${view_07034.category} ;;
  }

  access_filter: {
    field: view_07030.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07030.is_deleted} = false ;;
}
