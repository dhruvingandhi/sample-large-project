# Explore: explore_2204
# Auto-generated LookML Explore File

include: "/views/domain_13/view_06613.view.lkml"
include: "/views/domain_15/view_06615.view.lkml"
include: "/views/domain_16/view_06616.view.lkml"
include: "/views/domain_17/view_06617.view.lkml"

explore: explore_2204 {
  label: "Explore Explore 2204"
  description: "Comprehensive analytics explore joining base view_06613 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06613
  
  always_filter: {
    filters: [view_06613.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06613.created_at_date: "7 days"]
    unless: [view_06613.id, view_06613.status]
  }

  join: view_06615 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06613.user_id} = ${view_06615.id} ;;
    required_joins: []
  }

  join: view_06616 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06613.account_id} = ${view_06616.account_id} ;;
    required_joins: [view_06615]
  }

  join: view_06617 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06613.category} = ${view_06617.category} ;;
  }

  access_filter: {
    field: view_06613.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06613.is_deleted} = false ;;
}
