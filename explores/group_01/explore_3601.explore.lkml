# Explore: explore_3601
# Auto-generated LookML Explore File

include: "/views/domain_04/view_10804.view.lkml"
include: "/views/domain_06/view_10806.view.lkml"
include: "/views/domain_07/view_10807.view.lkml"
include: "/views/domain_08/view_10808.view.lkml"

explore: explore_3601 {
  label: "Explore Explore 3601"
  description: "Comprehensive analytics explore joining base view_10804 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10804
  
  always_filter: {
    filters: [view_10804.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10804.created_at_date: "7 days"]
    unless: [view_10804.id, view_10804.status]
  }

  join: view_10806 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10804.user_id} = ${view_10806.id} ;;
    required_joins: []
  }

  join: view_10807 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10804.account_id} = ${view_10807.account_id} ;;
    required_joins: [view_10806]
  }

  join: view_10808 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10804.category} = ${view_10808.category} ;;
  }

  access_filter: {
    field: view_10804.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10804.is_deleted} = false ;;
}
