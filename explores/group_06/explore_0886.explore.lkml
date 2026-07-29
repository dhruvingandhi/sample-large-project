# Explore: explore_0886
# Auto-generated LookML Explore File

include: "/views/domain_09/view_02659.view.lkml"
include: "/views/domain_11/view_02661.view.lkml"
include: "/views/domain_12/view_02662.view.lkml"
include: "/views/domain_13/view_02663.view.lkml"

explore: explore_0886 {
  label: "Explore Explore 0886"
  description: "Comprehensive analytics explore joining base view_02659 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02659
  
  always_filter: {
    filters: [view_02659.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02659.created_at_date: "7 days"]
    unless: [view_02659.id, view_02659.status]
  }

  join: view_02661 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02659.user_id} = ${view_02661.id} ;;
    required_joins: []
  }

  join: view_02662 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02659.account_id} = ${view_02662.account_id} ;;
    required_joins: [view_02661]
  }

  join: view_02663 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02659.category} = ${view_02663.category} ;;
  }

  access_filter: {
    field: view_02659.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02659.is_deleted} = false ;;
}
