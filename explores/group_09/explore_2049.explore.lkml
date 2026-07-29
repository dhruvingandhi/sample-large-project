# Explore: explore_2049
# Auto-generated LookML Explore File

include: "/views/domain_48/view_06148.view.lkml"
include: "/views/domain_50/view_06150.view.lkml"
include: "/views/domain_01/view_06151.view.lkml"
include: "/views/domain_02/view_06152.view.lkml"

explore: explore_2049 {
  label: "Explore Explore 2049"
  description: "Comprehensive analytics explore joining base view_06148 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06148
  
  always_filter: {
    filters: [view_06148.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06148.created_at_date: "7 days"]
    unless: [view_06148.id, view_06148.status]
  }

  join: view_06150 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06148.user_id} = ${view_06150.id} ;;
    required_joins: []
  }

  join: view_06151 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06148.account_id} = ${view_06151.account_id} ;;
    required_joins: [view_06150]
  }

  join: view_06152 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06148.category} = ${view_06152.category} ;;
  }

  access_filter: {
    field: view_06148.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06148.is_deleted} = false ;;
}
