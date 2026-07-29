# Explore: explore_1933
# Auto-generated LookML Explore File

include: "/views/domain_50/view_05800.view.lkml"
include: "/views/domain_02/view_05802.view.lkml"
include: "/views/domain_03/view_05803.view.lkml"
include: "/views/domain_04/view_05804.view.lkml"

explore: explore_1933 {
  label: "Explore Explore 1933"
  description: "Comprehensive analytics explore joining base view_05800 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05800
  
  always_filter: {
    filters: [view_05800.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05800.created_at_date: "7 days"]
    unless: [view_05800.id, view_05800.status]
  }

  join: view_05802 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05800.user_id} = ${view_05802.id} ;;
    required_joins: []
  }

  join: view_05803 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05800.account_id} = ${view_05803.account_id} ;;
    required_joins: [view_05802]
  }

  join: view_05804 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05800.category} = ${view_05804.category} ;;
  }

  access_filter: {
    field: view_05800.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05800.is_deleted} = false ;;
}
