# Explore: explore_2601
# Auto-generated LookML Explore File

include: "/views/domain_04/view_07804.view.lkml"
include: "/views/domain_06/view_07806.view.lkml"
include: "/views/domain_07/view_07807.view.lkml"
include: "/views/domain_08/view_07808.view.lkml"

explore: explore_2601 {
  label: "Explore Explore 2601"
  description: "Comprehensive analytics explore joining base view_07804 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07804
  
  always_filter: {
    filters: [view_07804.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07804.created_at_date: "7 days"]
    unless: [view_07804.id, view_07804.status]
  }

  join: view_07806 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07804.user_id} = ${view_07806.id} ;;
    required_joins: []
  }

  join: view_07807 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07804.account_id} = ${view_07807.account_id} ;;
    required_joins: [view_07806]
  }

  join: view_07808 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07804.category} = ${view_07808.category} ;;
  }

  access_filter: {
    field: view_07804.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07804.is_deleted} = false ;;
}
