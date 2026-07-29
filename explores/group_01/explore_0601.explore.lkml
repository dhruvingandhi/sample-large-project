# Explore: explore_0601
# Auto-generated LookML Explore File

include: "/views/domain_04/view_01804.view.lkml"
include: "/views/domain_06/view_01806.view.lkml"
include: "/views/domain_07/view_01807.view.lkml"
include: "/views/domain_08/view_01808.view.lkml"

explore: explore_0601 {
  label: "Explore Explore 0601"
  description: "Comprehensive analytics explore joining base view_01804 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01804
  
  always_filter: {
    filters: [view_01804.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01804.created_at_date: "7 days"]
    unless: [view_01804.id, view_01804.status]
  }

  join: view_01806 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01804.user_id} = ${view_01806.id} ;;
    required_joins: []
  }

  join: view_01807 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01804.account_id} = ${view_01807.account_id} ;;
    required_joins: [view_01806]
  }

  join: view_01808 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01804.category} = ${view_01808.category} ;;
  }

  access_filter: {
    field: view_01804.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01804.is_deleted} = false ;;
}
