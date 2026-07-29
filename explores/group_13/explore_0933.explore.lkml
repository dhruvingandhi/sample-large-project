# Explore: explore_0933
# Auto-generated LookML Explore File

include: "/views/domain_50/view_02800.view.lkml"
include: "/views/domain_02/view_02802.view.lkml"
include: "/views/domain_03/view_02803.view.lkml"
include: "/views/domain_04/view_02804.view.lkml"

explore: explore_0933 {
  label: "Explore Explore 0933"
  description: "Comprehensive analytics explore joining base view_02800 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02800
  
  always_filter: {
    filters: [view_02800.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02800.created_at_date: "7 days"]
    unless: [view_02800.id, view_02800.status]
  }

  join: view_02802 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02800.user_id} = ${view_02802.id} ;;
    required_joins: []
  }

  join: view_02803 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02800.account_id} = ${view_02803.account_id} ;;
    required_joins: [view_02802]
  }

  join: view_02804 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02800.category} = ${view_02804.category} ;;
  }

  access_filter: {
    field: view_02800.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02800.is_deleted} = false ;;
}
