# Explore: explore_0441
# Auto-generated LookML Explore File

include: "/views/domain_24/view_01324.view.lkml"
include: "/views/domain_26/view_01326.view.lkml"
include: "/views/domain_27/view_01327.view.lkml"
include: "/views/domain_28/view_01328.view.lkml"

explore: explore_0441 {
  label: "Explore Explore 0441"
  description: "Comprehensive analytics explore joining base view_01324 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01324
  
  always_filter: {
    filters: [view_01324.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01324.created_at_date: "7 days"]
    unless: [view_01324.id, view_01324.status]
  }

  join: view_01326 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01324.user_id} = ${view_01326.id} ;;
    required_joins: []
  }

  join: view_01327 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01324.account_id} = ${view_01327.account_id} ;;
    required_joins: [view_01326]
  }

  join: view_01328 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01324.category} = ${view_01328.category} ;;
  }

  access_filter: {
    field: view_01324.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01324.is_deleted} = false ;;
}
