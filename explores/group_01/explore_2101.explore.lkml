# Explore: explore_2101
# Auto-generated LookML Explore File

include: "/views/domain_04/view_06304.view.lkml"
include: "/views/domain_06/view_06306.view.lkml"
include: "/views/domain_07/view_06307.view.lkml"
include: "/views/domain_08/view_06308.view.lkml"

explore: explore_2101 {
  label: "Explore Explore 2101"
  description: "Comprehensive analytics explore joining base view_06304 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06304
  
  always_filter: {
    filters: [view_06304.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06304.created_at_date: "7 days"]
    unless: [view_06304.id, view_06304.status]
  }

  join: view_06306 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06304.user_id} = ${view_06306.id} ;;
    required_joins: []
  }

  join: view_06307 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06304.account_id} = ${view_06307.account_id} ;;
    required_joins: [view_06306]
  }

  join: view_06308 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06304.category} = ${view_06308.category} ;;
  }

  access_filter: {
    field: view_06304.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06304.is_deleted} = false ;;
}
