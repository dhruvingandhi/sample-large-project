# Explore: explore_1749
# Auto-generated LookML Explore File

include: "/views/domain_48/view_05248.view.lkml"
include: "/views/domain_50/view_05250.view.lkml"
include: "/views/domain_01/view_05251.view.lkml"
include: "/views/domain_02/view_05252.view.lkml"

explore: explore_1749 {
  label: "Explore Explore 1749"
  description: "Comprehensive analytics explore joining base view_05248 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05248
  
  always_filter: {
    filters: [view_05248.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05248.created_at_date: "7 days"]
    unless: [view_05248.id, view_05248.status]
  }

  join: view_05250 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05248.user_id} = ${view_05250.id} ;;
    required_joins: []
  }

  join: view_05251 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05248.account_id} = ${view_05251.account_id} ;;
    required_joins: [view_05250]
  }

  join: view_05252 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05248.category} = ${view_05252.category} ;;
  }

  access_filter: {
    field: view_05248.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05248.is_deleted} = false ;;
}
