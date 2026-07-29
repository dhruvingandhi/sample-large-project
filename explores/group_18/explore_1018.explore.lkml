# Explore: explore_1018
# Auto-generated LookML Explore File

include: "/views/domain_05/view_03055.view.lkml"
include: "/views/domain_07/view_03057.view.lkml"
include: "/views/domain_08/view_03058.view.lkml"
include: "/views/domain_09/view_03059.view.lkml"

explore: explore_1018 {
  label: "Explore Explore 1018"
  description: "Comprehensive analytics explore joining base view_03055 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03055
  
  always_filter: {
    filters: [view_03055.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03055.created_at_date: "7 days"]
    unless: [view_03055.id, view_03055.status]
  }

  join: view_03057 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03055.user_id} = ${view_03057.id} ;;
    required_joins: []
  }

  join: view_03058 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03055.account_id} = ${view_03058.account_id} ;;
    required_joins: [view_03057]
  }

  join: view_03059 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03055.category} = ${view_03059.category} ;;
  }

  access_filter: {
    field: view_03055.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03055.is_deleted} = false ;;
}
