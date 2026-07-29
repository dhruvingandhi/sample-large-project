# Explore: explore_1343
# Auto-generated LookML Explore File

include: "/views/domain_30/view_04030.view.lkml"
include: "/views/domain_32/view_04032.view.lkml"
include: "/views/domain_33/view_04033.view.lkml"
include: "/views/domain_34/view_04034.view.lkml"

explore: explore_1343 {
  label: "Explore Explore 1343"
  description: "Comprehensive analytics explore joining base view_04030 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04030
  
  always_filter: {
    filters: [view_04030.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04030.created_at_date: "7 days"]
    unless: [view_04030.id, view_04030.status]
  }

  join: view_04032 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04030.user_id} = ${view_04032.id} ;;
    required_joins: []
  }

  join: view_04033 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04030.account_id} = ${view_04033.account_id} ;;
    required_joins: [view_04032]
  }

  join: view_04034 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04030.category} = ${view_04034.category} ;;
  }

  access_filter: {
    field: view_04030.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04030.is_deleted} = false ;;
}
