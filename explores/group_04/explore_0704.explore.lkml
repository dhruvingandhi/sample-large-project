# Explore: explore_0704
# Auto-generated LookML Explore File

include: "/views/domain_13/view_02113.view.lkml"
include: "/views/domain_15/view_02115.view.lkml"
include: "/views/domain_16/view_02116.view.lkml"
include: "/views/domain_17/view_02117.view.lkml"

explore: explore_0704 {
  label: "Explore Explore 0704"
  description: "Comprehensive analytics explore joining base view_02113 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02113
  
  always_filter: {
    filters: [view_02113.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02113.created_at_date: "7 days"]
    unless: [view_02113.id, view_02113.status]
  }

  join: view_02115 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02113.user_id} = ${view_02115.id} ;;
    required_joins: []
  }

  join: view_02116 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02113.account_id} = ${view_02116.account_id} ;;
    required_joins: [view_02115]
  }

  join: view_02117 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02113.category} = ${view_02117.category} ;;
  }

  access_filter: {
    field: view_02113.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02113.is_deleted} = false ;;
}
