# Explore: explore_1149
# Auto-generated LookML Explore File

include: "/views/domain_48/view_03448.view.lkml"
include: "/views/domain_50/view_03450.view.lkml"
include: "/views/domain_01/view_03451.view.lkml"
include: "/views/domain_02/view_03452.view.lkml"

explore: explore_1149 {
  label: "Explore Explore 1149"
  description: "Comprehensive analytics explore joining base view_03448 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03448
  
  always_filter: {
    filters: [view_03448.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03448.created_at_date: "7 days"]
    unless: [view_03448.id, view_03448.status]
  }

  join: view_03450 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03448.user_id} = ${view_03450.id} ;;
    required_joins: []
  }

  join: view_03451 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03448.account_id} = ${view_03451.account_id} ;;
    required_joins: [view_03450]
  }

  join: view_03452 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03448.category} = ${view_03452.category} ;;
  }

  access_filter: {
    field: view_03448.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03448.is_deleted} = false ;;
}
