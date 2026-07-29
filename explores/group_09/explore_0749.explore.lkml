# Explore: explore_0749
# Auto-generated LookML Explore File

include: "/views/domain_48/view_02248.view.lkml"
include: "/views/domain_50/view_02250.view.lkml"
include: "/views/domain_01/view_02251.view.lkml"
include: "/views/domain_02/view_02252.view.lkml"

explore: explore_0749 {
  label: "Explore Explore 0749"
  description: "Comprehensive analytics explore joining base view_02248 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02248
  
  always_filter: {
    filters: [view_02248.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02248.created_at_date: "7 days"]
    unless: [view_02248.id, view_02248.status]
  }

  join: view_02250 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02248.user_id} = ${view_02250.id} ;;
    required_joins: []
  }

  join: view_02251 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02248.account_id} = ${view_02251.account_id} ;;
    required_joins: [view_02250]
  }

  join: view_02252 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02248.category} = ${view_02252.category} ;;
  }

  access_filter: {
    field: view_02248.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02248.is_deleted} = false ;;
}
