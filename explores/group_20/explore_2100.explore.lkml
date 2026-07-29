# Explore: explore_2100
# Auto-generated LookML Explore File

include: "/views/domain_01/view_06301.view.lkml"
include: "/views/domain_03/view_06303.view.lkml"
include: "/views/domain_04/view_06304.view.lkml"
include: "/views/domain_05/view_06305.view.lkml"

explore: explore_2100 {
  label: "Explore Explore 2100"
  description: "Comprehensive analytics explore joining base view_06301 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06301
  
  always_filter: {
    filters: [view_06301.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06301.created_at_date: "7 days"]
    unless: [view_06301.id, view_06301.status]
  }

  join: view_06303 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06301.user_id} = ${view_06303.id} ;;
    required_joins: []
  }

  join: view_06304 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06301.account_id} = ${view_06304.account_id} ;;
    required_joins: [view_06303]
  }

  join: view_06305 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06301.category} = ${view_06305.category} ;;
  }

  access_filter: {
    field: view_06301.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06301.is_deleted} = false ;;
}
