# Explore: explore_3184
# Auto-generated LookML Explore File

include: "/views/domain_03/view_09553.view.lkml"
include: "/views/domain_05/view_09555.view.lkml"
include: "/views/domain_06/view_09556.view.lkml"
include: "/views/domain_07/view_09557.view.lkml"

explore: explore_3184 {
  label: "Explore Explore 3184"
  description: "Comprehensive analytics explore joining base view_09553 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09553
  
  always_filter: {
    filters: [view_09553.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09553.created_at_date: "7 days"]
    unless: [view_09553.id, view_09553.status]
  }

  join: view_09555 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09553.user_id} = ${view_09555.id} ;;
    required_joins: []
  }

  join: view_09556 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09553.account_id} = ${view_09556.account_id} ;;
    required_joins: [view_09555]
  }

  join: view_09557 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09553.category} = ${view_09557.category} ;;
  }

  access_filter: {
    field: view_09553.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09553.is_deleted} = false ;;
}
