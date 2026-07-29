# Explore: explore_1937
# Auto-generated LookML Explore File

include: "/views/domain_12/view_05812.view.lkml"
include: "/views/domain_14/view_05814.view.lkml"
include: "/views/domain_15/view_05815.view.lkml"
include: "/views/domain_16/view_05816.view.lkml"

explore: explore_1937 {
  label: "Explore Explore 1937"
  description: "Comprehensive analytics explore joining base view_05812 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05812
  
  always_filter: {
    filters: [view_05812.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05812.created_at_date: "7 days"]
    unless: [view_05812.id, view_05812.status]
  }

  join: view_05814 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05812.user_id} = ${view_05814.id} ;;
    required_joins: []
  }

  join: view_05815 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05812.account_id} = ${view_05815.account_id} ;;
    required_joins: [view_05814]
  }

  join: view_05816 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05812.category} = ${view_05816.category} ;;
  }

  access_filter: {
    field: view_05812.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05812.is_deleted} = false ;;
}
