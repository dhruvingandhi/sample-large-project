# Explore: explore_1221
# Auto-generated LookML Explore File

include: "/views/domain_14/view_03664.view.lkml"
include: "/views/domain_16/view_03666.view.lkml"
include: "/views/domain_17/view_03667.view.lkml"
include: "/views/domain_18/view_03668.view.lkml"

explore: explore_1221 {
  label: "Explore Explore 1221"
  description: "Comprehensive analytics explore joining base view_03664 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03664
  
  always_filter: {
    filters: [view_03664.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03664.created_at_date: "7 days"]
    unless: [view_03664.id, view_03664.status]
  }

  join: view_03666 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03664.user_id} = ${view_03666.id} ;;
    required_joins: []
  }

  join: view_03667 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03664.account_id} = ${view_03667.account_id} ;;
    required_joins: [view_03666]
  }

  join: view_03668 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03664.category} = ${view_03668.category} ;;
  }

  access_filter: {
    field: view_03664.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03664.is_deleted} = false ;;
}
