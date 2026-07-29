# Explore: explore_1053
# Auto-generated LookML Explore File

include: "/views/domain_10/view_03160.view.lkml"
include: "/views/domain_12/view_03162.view.lkml"
include: "/views/domain_13/view_03163.view.lkml"
include: "/views/domain_14/view_03164.view.lkml"

explore: explore_1053 {
  label: "Explore Explore 1053"
  description: "Comprehensive analytics explore joining base view_03160 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03160
  
  always_filter: {
    filters: [view_03160.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03160.created_at_date: "7 days"]
    unless: [view_03160.id, view_03160.status]
  }

  join: view_03162 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03160.user_id} = ${view_03162.id} ;;
    required_joins: []
  }

  join: view_03163 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03160.account_id} = ${view_03163.account_id} ;;
    required_joins: [view_03162]
  }

  join: view_03164 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03160.category} = ${view_03164.category} ;;
  }

  access_filter: {
    field: view_03160.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03160.is_deleted} = false ;;
}
