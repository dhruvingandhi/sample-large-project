# Explore: explore_2949
# Auto-generated LookML Explore File

include: "/views/domain_48/view_08848.view.lkml"
include: "/views/domain_50/view_08850.view.lkml"
include: "/views/domain_01/view_08851.view.lkml"
include: "/views/domain_02/view_08852.view.lkml"

explore: explore_2949 {
  label: "Explore Explore 2949"
  description: "Comprehensive analytics explore joining base view_08848 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08848
  
  always_filter: {
    filters: [view_08848.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08848.created_at_date: "7 days"]
    unless: [view_08848.id, view_08848.status]
  }

  join: view_08850 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08848.user_id} = ${view_08850.id} ;;
    required_joins: []
  }

  join: view_08851 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08848.account_id} = ${view_08851.account_id} ;;
    required_joins: [view_08850]
  }

  join: view_08852 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08848.category} = ${view_08852.category} ;;
  }

  access_filter: {
    field: view_08848.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08848.is_deleted} = false ;;
}
