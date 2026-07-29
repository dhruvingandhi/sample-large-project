# Explore: explore_0105
# Auto-generated LookML Explore File

include: "/views/domain_16/view_00316.view.lkml"
include: "/views/domain_18/view_00318.view.lkml"
include: "/views/domain_19/view_00319.view.lkml"
include: "/views/domain_20/view_00320.view.lkml"

explore: explore_0105 {
  label: "Explore Explore 0105"
  description: "Comprehensive analytics explore joining base view_00316 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00316
  
  always_filter: {
    filters: [view_00316.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00316.created_at_date: "7 days"]
    unless: [view_00316.id, view_00316.status]
  }

  join: view_00318 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00316.user_id} = ${view_00318.id} ;;
    required_joins: []
  }

  join: view_00319 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00316.account_id} = ${view_00319.account_id} ;;
    required_joins: [view_00318]
  }

  join: view_00320 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00316.category} = ${view_00320.category} ;;
  }

  access_filter: {
    field: view_00316.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00316.is_deleted} = false ;;
}
