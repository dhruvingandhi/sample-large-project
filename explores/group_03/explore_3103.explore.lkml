# Explore: explore_3103
# Auto-generated LookML Explore File

include: "/views/domain_10/view_09310.view.lkml"
include: "/views/domain_12/view_09312.view.lkml"
include: "/views/domain_13/view_09313.view.lkml"
include: "/views/domain_14/view_09314.view.lkml"

explore: explore_3103 {
  label: "Explore Explore 3103"
  description: "Comprehensive analytics explore joining base view_09310 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09310
  
  always_filter: {
    filters: [view_09310.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09310.created_at_date: "7 days"]
    unless: [view_09310.id, view_09310.status]
  }

  join: view_09312 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09310.user_id} = ${view_09312.id} ;;
    required_joins: []
  }

  join: view_09313 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09310.account_id} = ${view_09313.account_id} ;;
    required_joins: [view_09312]
  }

  join: view_09314 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09310.category} = ${view_09314.category} ;;
  }

  access_filter: {
    field: view_09310.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09310.is_deleted} = false ;;
}
